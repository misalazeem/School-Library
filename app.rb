require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'classroom'
require_relative 'display_people'
require_relative 'create_person'
require_relative 'create_student'
require_relative 'create_teacher'
require_relative 'display_books'

class App
  attr_accessor :books, :stundents, :teachers, :rental

  include Display_people
  include Create_person
  include Create_student
  include Create_teacher
  include Display_books

  def initialize
    @people = []
    @books = []
    @rentals = []
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
