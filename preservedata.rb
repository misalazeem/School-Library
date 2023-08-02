require 'json'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'person'
require_relative 'rental'

module PreserveData
  BOOKS_FILE_NAME = './books.json'.freeze
  PERSON_FILE_NAME = './person.json'.freeze
  RENTALS_FILE_NAME = './rental.json'.freeze

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

  def save_people
    people_list = @people.map do |person|
      {
        name: person.name,
        age: person.age,
        id: person.id,
        parent_permission: person.parent_permission || false
      }
    end
    save_to_file(PERSON_FILE_NAME, people_list)
  end

  def save_rentals
    rentals_list = @rentals.map do |rental|
      {
        date: rental.date,
        book_title: rental.book.title,
        person_id: rental.person.id
      }
    end
    save_to_file(RENTALS_FILE_NAME, rentals_list)
  end
end
