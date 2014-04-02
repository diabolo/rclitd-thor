module TaskSH
  def add_task(attrs={})
    run_simple(
      unescape("#{xec} new 'New task' #{opts(attrs)}"),
      false
    )
  end

  def count_tasks(attrs={})
    typ = attrs[:type] || :all
    loc = attrs[:location] || default_location

    case typ
    when :completed
      count_completed_tasks(loc)
    else
      count_all_tasks(loc)
    end
  end

  def count_all_tasks(loc)
    count = File.open(loc) do |f|
      f.readlines.count
    end
  end

  def count_completed_tasks(loc)
    count = File.open(loc) do |f|
      f.readlines.count { |l| l.match /^x / }
    end
  end

  def count_listed_tasks(attrs={})
    `#{xec} list #{opts(attrs)} | wc -l`.chomp.to_i
  end

  def complete_task(attrs={})
    run_simple("#{xec} do 1 #{opts(attrs)}")
  end
end
World TaskSH


