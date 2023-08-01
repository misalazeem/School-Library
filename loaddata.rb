require 'json'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'

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

  def load_data_from_file(file_name)
    file = File.read(file_name)
    JSON.parse(file)
  end
end
