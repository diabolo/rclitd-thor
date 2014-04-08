require 'thor'

module Todo

  class App < Thor
    class_option :location,
      aliases: :f,
      desc: 'provide alternative location for the todo file.',
      banner: 'location of todo file'

    desc "new TASK_DESCRIPTION", "add a new task to your task list"
    def new(desc)
      Todo::CMD.add_task(desc, options)
    end

    desc "list", "list your tasks"
    option :type,
      aliases: :t,
      desc: 'completed || all(default)',
      default: :all,
      type: :string
    def list
      Todo::CMD.list_tasks(options)
    end

    desc "do", "complete a task"
    def do(task)
      Todo::CMD.do(task)
    end
  end

end

