module Todo
  def self.location(options={})
    options[:location] || "#{ENV['HOME']}/.todo.txt"
  end

  class CMD
    def self.add_task(desc, options={})
      File.open(Todo.location(options), 'a+') do |f|
        f.puts [desc, Time.now].join(',')
      end
    end

    def self.list_tasks(options)
      tasks = Todo::Tasks.new(options)
      tasks.list.each do |line|
        puts line
      end

      # Close tasks!

      # File.open(Todo.location(options)) do |f|
      #   f.readlines.each do |line|
      #     puts line
      #   end
      # end
    end

    def self.do(task, options={})
      y = File.open(Todo.location(options)) do |f|
        x = f.readlines
        x.each_with_index do |line,index|
          x[index] = "#{Todo::Task::DONE_PFX}#{line}" if index == task.to_i - 1
        end
        x
      end

      File.open(Todo.location(options), 'w') do |f|
        y.each do |line|
          f.puts line
        end
      end
    end

  end
end
