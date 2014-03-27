module TaskSH
  def add_task(attrs={})
    run_simple(
      unescape("#{xec} new 'New task' #{opts(attrs)}"),
      false
    )
  end

  def task_count(attrs={})
    `#{xec} list #{opts(attrs)} | wc -l`.chomp.to_i
  end
end
World TaskSH

module LocationSH
  def default_location
    Todo.location
  end

  def custom_location
    "#{default_location}.custom"
  end

  def no_op; end
end
World LocationSH

module CmdSH
  # returns the executable part of the cmd e.g.
  # todo
  # todo -f 'tmp/wibble.td'
  def xec()
    'todo ' # must end with a space
  end

  def opts(attrs)
    "-f #{attrs[:location]}" if attrs[:location]
  end
end
World CmdSH

When /^I add a task$/ do
  add_task
end

Then /^there should be a task$/ do
  task_count.should == 1
end


When /^I add (\d+) tasks$/ do |num|
  num.to_i.times { add_task }
end

When /^I add (\d+) tasks with the custom location$/ do |num|
  num.to_i.times {
    add_task location: custom_location
  }
end

Then /^there should be (\d+) tasks$/ do |num|
  task_count.should == num.to_i
end

Then /^I should see (\d+) tasks when I list tasks from the custom location$/ do |num|
  task_count(location: custom_location).should == num.to_i
end

Then /^there should be (\d+) tasks? in the custom location$/ do |num|
  File.open(custom_location) do |f|
    f.readlines.count.should == num.to_i
  end
end

Given /^there is a custom location$/ do
  no_op
end

When /^I add a task with the custom location$/ do
  add_task location: custom_location
end

