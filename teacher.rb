require './person'

class Teacher < Person
  attr_reader :classroom, :specialization

  def initialize(age, name, specialization, classroom='junior', parent_permission = 'true')
    super(age, name, parent_permission)
    @specialization = specialization
    @classroom = classroom
  end

  def can_use_services?
    true
  end
end
