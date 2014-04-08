module CmdSH
  # returns the executable part of the cmd e.g.
  # todo
  # todo -f 'tmp/wibble.td'
  def xec()
    'todo ' # must end with a space
  end

  def opts(attrs)
    opts = ''.tap do |o|
      o << " -f #{attrs[:location]}" if attrs[:location]
      o << " -t #{attrs[:type]}" if attrs[:type]
    end
  end
end
World CmdSH


