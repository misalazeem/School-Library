require_relative 'person'

class Student < Person
  attr_accessor :parent_permission, :title
  attr_reader :classroom

  def initialize(classroom1, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom1
    @title = 'Student'
  end

  def classroom=(classroom)
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
