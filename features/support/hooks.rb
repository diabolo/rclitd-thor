module Cuke
  module Env
    FAKEHOME='/tmp/fakehome'

    def self.relocate_home
      ENV['HOME']=FAKEHOME
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

Before do
  Cuke::Env.trash_then_create_fakehome
end

