module Cuke
  module Env
    FAKEHOME='/tmp/fakehome'
    THOR_DEBUG='1' # turn off by setting to '0' (String)

    def self.relocate_home
      ENV['HOME']=FAKEHOME
    end

    def self.debug_thor
      ENV['THOR_DEBUG']=THOR_DEBUG
    end

    def self.trash_then_create_fakehome
      raise RuntimeError.new(
        "About to write in #{Todo.location}"
      ) unless Todo.location == "#{FAKEHOME}/.todo.txt"

      FileUtils.rm_rf FAKEHOME
      FileUtils.mkdir_p FAKEHOME
    end
  end
end

# Do this before each run
Cuke::Env.relocate_home
Cuke::Env.debug_thor

Before do
  Cuke::Env.trash_then_create_fakehome
end

