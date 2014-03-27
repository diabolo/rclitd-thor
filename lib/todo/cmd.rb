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
      File.open(Todo.location(options)) do |f|
        f.readlines.each do |line|
          puts line
        end
      end
    end

  end
end
