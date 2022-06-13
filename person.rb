class Person
  def initialize(name="Unknown", age, parent_permission: true)
    @id = Math.floor(Math.random * 10)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # getters
  attr_reader :id
  attr_reader :name
  attr_reader :age

  # Setters
  attr_writer :name
  attr_writer :age
end