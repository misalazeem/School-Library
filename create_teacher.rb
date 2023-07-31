require_relative 'app'

module CreateTeacher
  def create_teacher(name, age, specialization)
    teacher = Teacher.new(specialization, age, name)
    @people << teacher
  end
end
