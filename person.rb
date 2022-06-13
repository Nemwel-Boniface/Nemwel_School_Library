class Person
  def initialize(name="Unknown", age, parent_permission: true)
    @id = Random.rand(1..1000)
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

  def can_use_services?
    if @age >= 18 || @parent_permission
      true
    else
      false
    end
  end

  private
  def is_of_age?
    @age >= 18 ? true : false
  end
end