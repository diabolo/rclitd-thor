require 'thor'

module Todo
  class App < Thor
    class_option :location,
      aliases: :f,
      desc: 'provide alternative location for the todo file.',
      banner: 'location of todo file'

    desc "new TASK_DESCRIPTION", "add a new task to your task list"
    def new(desc)
      Todo::CMD.add_task(desc)
    end

    desc "list", "list your tasks"
    def list
      Todo::CMD.list_tasks
    end

  end
  class Runner
    def initialize(argv, stdin=STDIN, stdout=STDOUT, stderr=STDERR, kernel=Kernel)
      @argv, @stdin, @stdout, @stderr, @kernel = argv, stdin, stdout, stderr, kernel
    end

    def execute!
      exit_code = begin
        # Thor accesses these streams directly rather than letting them be injected, so we replace them...
        $stderr = @stderr
        $stdin = @stdin
        $stdout = @stdout

        # Run our normal Thor app the way we know and love.
        Todo::App.start(@argv)

        # Thor::Base#start does not have a return value, assume success if no exception is raised.
        0
      ensure
        # ...then we put them back.
        $stderr = STDERR
        $stdin = STDIN
        $stdout = STDOUT
      end

      # Proxy our exit code back to the injected kernel.
      @kernel.exit(exit_code)
    end
  end

end
