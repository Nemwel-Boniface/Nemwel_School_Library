require './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom)
    super()
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.includes?(self)
  end
end
