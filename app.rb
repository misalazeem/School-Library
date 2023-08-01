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
require_relative 'create_book'
require_relative 'create_rental'
require_relative 'rental_list'
require_relative 'preservedata'
require_relative 'loaddata'

class App
  attr_accessor :books, :stundents, :teachers, :rental

  include DisplayPeople
  include CreatePerson
  include CreateStudent
  include CreateTeacher
  include DisplayBooks
  include CreateBook
  include CreateRental
  include RentalList
  include PreserveData
  include LoadData

  def initialize
    @people = []
    @books = []
    @rentals = []
    load_books
  end

  def run(option)
    case option
    when 1
      display_all_books
    when 2
      display_all_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      rental_list
    else
      puts 'Thank you for using this app!'
      exit
    end
  end
  def exit
    save_books
  end
end
