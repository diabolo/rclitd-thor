
When /^I list my completed tasks$/ do
  list_tasks type: :completed
end

Then /^I should see one task$/ do
  count_listed_tasks.should == 1
end

Given /^there is a custom location$/ do
  no_op
end

When /^I add a task$/ do
  add_task
end

When /^I add (\d+) tasks$/ do |num|
  num.to_i.times { add_task }
end

When /^I add a task with the custom location$/ do
  add_task location: custom_location
end

When /^I add (\d+) tasks with the custom location$/ do |num|
  num.to_i.times {
    add_task location: custom_location
  }
end

Then /^there should be a task$/ do
  count_tasks.should == 1
end

Then /^there should be (\d+) tasks$/ do |num|
  count_tasks.should == num.to_i
end

Then /^there should be (\d+) tasks? in the custom location$/ do |num|
  count_tasks(location: custom_location).should == num.to_i
end

Then /^I should see (\d+) tasks when I list tasks from the custom location$/ do |num|
  list_tasks(location: custom_location)
  count_listed_tasks(location: custom_location).should == num.to_i
end

Given /^I have added some tasks$/ do
  some.times { add_task }
end

When /^I complete a task$/ do
  complete_task
end

Then /^there should be a completed task$/ do
  count_tasks(type: :completed).should == 1
end
