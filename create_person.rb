require_relative 'create_student'

module Create_person
  def create_person
    print 'Do you want to create a Student(1) or a Teacher(2)? [Input the number]: '
    p_option = gets.chomp.to_i
    while p_option != 1 && p_option != 2
      puts 'Invalid input. Please enter 1 or 2:'
      gets.chomp.to_i
    end
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    if p_option == 1
      print 'Has parent permission [Y/N]: '
      parent_permission = gets.chomp.upcase
      create_student(name, age, parent_permission, classroom_: 'class')
    else
      print 'Specialization: '
      specialization = gets.chomp
      create_teacher(name, age, specialization)
    end
    puts 'Person created successfully'
  end
end
