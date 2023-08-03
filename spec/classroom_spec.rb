require_relative '../classroom'

describe Classroom do
  let(:student) { Student.new(21, 'Bob') }
  let(:classroom) { Classroom.new('Math') }
  let(:classroom_student) { Classroom.new('Math').add_student(student) }

  describe '#new' do
    it 'takes a label and a number as parameters and returns a Classroom object' do
      expect(classroom).to be_an_instance_of(Classroom)
    end
  end

  describe '#label' do
    it 'returns the correct label' do
      expect(classroom.label).to eq('Math')
    end
  end

  describe '#students' do
    it 'returns an empty array' do
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom' do
      expect(classroom_student.students).to include(student)
    end
  end
end
