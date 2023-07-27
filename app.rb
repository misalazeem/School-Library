require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'classroom'

class App
  attr_accessor :books, :stundents, :teachers, :rental 

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def display_all_people
    @people.each_with_index do |people, index|
      puts "#{index}) [#{people.title}] Name: #{people.name}, ID: #{people.id}, Age: #{people.age}"
    end
  end

  def display_all_books
    @books.each_with_index do |book, index|
      puts "#{index}) Title: '#{book.title}', Author: '#{book.author}'"
    end
  end

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

  def create_teacher(name, age, specialization)
    teacher = Teacher.new(specialization, age, name)
    @people << teacher
  end

  def create_student(name, age, _parent_permission, classroom_)
    classroom = Classroom.new(classroom_)
    student = Student.new(classroom, age, name)
    @people << student
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    display_all_books
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    display_all_people
    person_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals << rental

    puts 'Rental created successfully'
  end

  def rental_list
    puts 'Enter ID of the person'
    display_all_people
    person_id = gets.chomp.to_i
    person = @people.select { |p| p.id == person_id }[0]
    puts 'Rentals: '
    person.rentals.each_with_index do |rental, index|
      puts "#{index + 1}) Book: #{rental.book.title}, Date: #{rental.date}"
    end
  end

  def run
    prompt
  end
end
