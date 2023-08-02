require_relative '../book'
require_relative '../rental'
require_relative '../person'

RSpec.describe Book do
  let(:title) { 'The Great Gatsby' }
  let(:author) { 'F. Scott Fitzgerald' }
  let(:book) { Book.new(title, author) }

  describe '#initialize' do
    it 'creates a new book with the correct title and author' do
      expect(book.title).to eq(title)
      expect(book.author).to eq(author)
    end

    it 'creates a new book with an empty rentals array' do
      expect(book.rentals).to be_an(Array)
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    it 'creates a new rental for the book and person' do
      person = Person.new(25, 'John Doe')
      date = '2023/08/03'
      rental = book.add_rental(person, date)

      expect(rental).to be_a(Rental)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(rental.date).to eq(date)
    end

    it "adds the rental to the book's rentals array" do
      person = Person.new(30, 'Jane Smith')
      date = '2023/08/03'
      book.add_rental(person, date)

      expect(book.rentals.length).to eq(1)
      expect(book.rentals.first).to be_a(Rental)
      expect(book.rentals.first.person).to eq(person)
      expect(book.rentals.first.date).to eq(date)
    end
  end
end
