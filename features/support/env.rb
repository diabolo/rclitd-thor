require 'aruba/cucumber'
require 'aruba/in_process'
require 'debugger'
require 'todo'

# see hooks.rb
Aruba::InProcess.main_class = Todo::Runner
Aruba.process = Aruba::InProcess
