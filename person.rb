class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # getters
  attr_reader :id
  attr_accessor :name, :age

  # Setters

  def can_use_services?
    if @age >= 18 || @parent_permission
      true
    else
      false
    end
  end

  private

  def of_age?
    @age >= 18
  end
end
