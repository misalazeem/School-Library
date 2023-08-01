require 'json'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'

module PreserveData
  BOOKS_FILE_NAME = './books.json'
  PERSON_FILE_NAME = './person.json'
  RENTALS_FILE_NAME = './rental.json'

  def save_to_file(file_name, data)
    File.write(file_name, JSON.pretty_generate(data))
  end

  def save_books
    books_list = @books.map do |book|
      {
        title: book.title,
        author: book.author
      }
    end
    save_to_file(BOOKS_FILE_NAME, books_list)
  end
end