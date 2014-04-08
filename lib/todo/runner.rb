module Todo
  class Runner
    def initialize(
      argv,
      stdin=STDIN,
      stdout=STDOUT,
      stderr=STDERR,
      kernel=Kernel
    )
      @argv = argv
      @stdin = stdin
      @stdout = stdout
      @stderr = stderr
      @kernel = kernel
    end

    def execute!
      exit_code = begin

        # Thor accesses these streams directly rather than letting them be
        # injected, so we replace them...
        $stderr = @stderr
        $stdin = @stdin
        $stdout = @stdout

        # Run our normal Thor app the way we know and love.
        x = Todo::App.start(@argv)

        # Thor::Base#start does not have a return value, assume success if no
        # exception is raised.
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
