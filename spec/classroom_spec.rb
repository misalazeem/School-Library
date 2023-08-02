require './classroom'
require './student'

describe Classroom do
  context 'when testing classroom class' do
    before :all do
      @classroom = Classroom.new('label')
      @student = Student.new(15, 'John')
    end

    it 'should have label and students attributes' do
      expect(@classroom).to have_attributes(label: 'label')
      expect(@classroom.students).to be_empty
    end

    it 'should add a student to the classroom' do
      @classroom.add_student(@student)
      expect(@classroom.students).to include(@student)
      expect(@student.classroom).to eq(@classroom)
    end
  end
end
