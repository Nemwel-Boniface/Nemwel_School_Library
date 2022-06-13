class Person
  def initialize(name="Unknown", age, parent_permission: true)
    @id = Math.floor(Math.random * 10)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
end