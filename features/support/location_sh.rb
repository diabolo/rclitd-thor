module LocationSH
  def default_location
    Todo.location
  end

  def custom_location
    "#{default_location}.custom"
  end

  def no_op; end
end
World LocationSH


