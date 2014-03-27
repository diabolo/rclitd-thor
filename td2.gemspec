# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','todo','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'td2'
  s.version = Todo::VERSION
  s.author = 'Andrew Premdas'
  s.email = 'apremdas@gmail.com'
  s.homepage = 'http://blog.andrew.premdas.org'
  s.platform = Gem::Platform::RUBY
  s.summary = 'CLI Task List Manager'
  s.files = `git ls-files`.split("
")
  s.require_paths << 'lib'
  s.has_rdoc = false
  # s.has_rdoc = true
  # s.extra_rdoc_files = ['README.rdoc','td2.rdoc']
  # s.rdoc_options << '--title' << 'td2' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'todo'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_development_dependency('debugger')
  
  s.add_dependency 'thor'
end
