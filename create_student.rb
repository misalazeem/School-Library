require_relative 'student'
require_relative 'app'

module Create_student
  def create_student(name, age, _parent_permission, classroom_)
    classroom = Classroom.new(classroom_)
    student = Student.new(classroom, age, name)
    @people << student
  end
end
