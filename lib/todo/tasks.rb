module Todo
  class Tasks
    attr_reader :options

    def initialize(options={})
      @options = options
    end

    def list
      File.open(Todo.location(options)) do |f|
        f.readlines.each do |line|
          case options[:type]
          when 'completed'
            puts line if line.match Todo::Task::DONE_RGX
          else
            puts line
          end
        end
      end
    end


  end
end
