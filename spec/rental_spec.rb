require './rental'
require './book'
require './person'

describe Rental do
  context 'when testing rental class' do
    before :all do
      @book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
      @person = Person.new(20, 'John Doe')
      @rental = Rental.new('2023-08-02', @book, @person)
    end

    it 'should have date, book, and person attributes' do
      expect(@rental).to have_attributes(date: '2023-08-02')
      expect(@rental.book).to eq(@book)
      expect(@rental.person).to eq(@person)
    end

    it 'should add rental to book and person rentals' do
      expect(@book.rentals).to include(@rental)
      expect(@person.rentals).to include(@rental)
    end
  end
end
