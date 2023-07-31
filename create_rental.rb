require_relative 'app'
require_relative 'book'
require_relative 'rental'

module Create_rental
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
end