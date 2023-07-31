require_relative 'app'

module Create_teacher
  def create_teacher(name, age, specialization)
    teacher = Teacher.new(specialization, age, name)
    @people << teacher
  end
end
