module Todo
  def self.location
    "#{ENV['HOME']}/.todo.txt"
  end

  class CMD
    def self.add_task(desc)
      File.open(Todo.location, 'a+') do |f|
        f.puts [desc, Time.now].join(',')
      end
    end

    def self.list_tasks
      File.open(Todo.location) do |f|
        f.readlines.each do |line|
          puts line
        end
      end
    end
  end
end
