require_relative 'app'

module DisplayPeople
  def display_all_people
    @people.each_with_index do |people, index|
      puts "#{index}) [#{people.title}] Name: #{people.name}, ID: #{people.id}, Age: #{people.age}"
    end
  end
end
