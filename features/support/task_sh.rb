module TaskSH
  def add_task(attrs={})
    run_simple(
      unescape("#{xec} new 'New task' #{opts(attrs)}"),
      false
    )
  end

  def count_tasks(attrs={})
    loc = attrs[:location] || default_location
    count = File.open(loc) do |f|
      f.readlines.count
    end
  end

  def count_listed_tasks(attrs={})
    `#{xec} list #{opts(attrs)} | wc -l`.chomp.to_i
  end
end
World TaskSH


