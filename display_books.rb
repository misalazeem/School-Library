require_relative 'app'

module DisplayBooks
  def display_all_books
    @books.each_with_index do |book, index|
      puts "#{index}) Title: '#{book.title}', Author: '#{book.author}'"
    end
  end
end
