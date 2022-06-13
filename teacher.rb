require "./person.rb"

class Teacher < Person
  def initialize(specialization)
    super()
    @specialization = specialization
  end
end