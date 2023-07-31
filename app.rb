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

class App
  attr_accessor :books, :stundents, :teachers, :rental

  include Display_people
  include Create_person
  include Create_student
  include Create_teacher
  include Display_books
  include Create_book
  include Create_rental
  include Rental_list

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def run
    prompt
  end
end
