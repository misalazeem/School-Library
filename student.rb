require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom1, age, name = 'unknown', parent_permmission: true)
    super(age, name, parent_permmission)
    @classroom = classroom_(classroom1)
  end

  def classroom_(classroom)
    @classroom = classroom
    classroom.student.push(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
