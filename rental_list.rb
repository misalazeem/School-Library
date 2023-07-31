require_relative 'app'

module Rental_list
  def rental_list
    puts 'Enter ID of the person'
    display_all_people
    person_id = gets.chomp.to_i
    person = @people.select { |p| p.id == person_id }[0]
    puts 'Rentals: '
    person.rentals.each_with_index do |rental, index|
      puts "#{index + 1}) Book: #{rental.book.title}, Date: #{rental.date}"
    end
  end
end