require_relative '../student'
require_relative '../classroom'

describe Student do
  before :all do
    @classroom = Classroom.new('101A')
    @student = Student.new(@classroom, 22, 'Bill Gates', parent_permission: false)
  end

  describe '#new' do
    it 'takes 4 parameters and returns a student object' do
      expect(@student).to be_an_instance_of(Student)
    end
  end

  describe '#classroom' do
    it 'takes one parameter and adds the student to students array of classroom object' do
      @student.classroom = @classroom
      expect(@student.classroom.students.length).to eq(1)
    end
  end
end
