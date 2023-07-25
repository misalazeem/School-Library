require_relative 'basedecorator'
require_relative 'person'
require_relative 'capitalizedecorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    return @nameable.correct_name[0, 9] if @nameable.correct_name.length > 10

    @nameable.correct_name
  end
end

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name