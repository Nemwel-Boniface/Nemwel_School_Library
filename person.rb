require './nameable'
require './decorator'
require './capitalizedecorator'
require './trimmerdecorator'

class Person < Nameable
  # getters and setters
  attr_reader :id, :rental
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  def add_rental(rental)
    @rental.push(rental)
    rental.person = self
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
