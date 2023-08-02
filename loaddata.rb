require 'json'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'person'
require_relative 'rental'

module LoadData
  BOOKS_FILE_NAME = './books.json'.freeze
  PERSON_FILE_NAME = './person.json'.freeze
  RENTALS_FILE_NAME = './rental.json'.freeze

  def load_books
    books_list = []
    return books_list unless File.exist?(BOOKS_FILE_NAME)

    books_list = load_data_from_file(BOOKS_FILE_NAME)

    @books = books_list.map do |book|
      Book.new(book['title'], book['author'])
    end
  end

  def load_people
    people_list = []
    return people_list unless File.exist?(PERSON_FILE_NAME)

    people_list = load_data_from_file(PERSON_FILE_NAME)

    @people = people_list.map do |person|
      parent_permission = person['parent_permission'] || false
      Person.new(person['age'], person['name'], parent_permission: parent_permission)
    end
  end

  def load_rentals
    rentals_list = []
    return rentals_list unless File.exist?(RENTALS_FILE_NAME)

    rentals_list = load_data_from_file(RENTALS_FILE_NAME)

    @rentals = rentals_list.map do |rental_data|
      book = @books.find { |book| book.title == rental_data['book_title'] }
      person = @people.find { |person| person.id == rental_data['person_id'] }
      Rental.new(rental_data['date'], book, person)
    end
  end

  def load_data_from_file(file_name)
    file = File.read(file_name)
    return [] if file.strip.empty?  # Return an empty array if the file is empty
    JSON.parse(file)
  end

  # def load_data_from_file(file_name)
  #   file = File.read(file_name)
  #   JSON.parse(file)
  # end
end
