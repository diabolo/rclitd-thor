module CmdSH
  # returns the executable part of the cmd e.g.
  # todo
  # todo -f 'tmp/wibble.td'
  def xec()
    'todo ' # must end with a space
  end

  def opts(attrs)
    "-f #{attrs[:location]}" if attrs[:location]
  end
end
World CmdSH


