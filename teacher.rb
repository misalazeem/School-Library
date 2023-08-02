require_relative 'person'

class Teacher < Person
  attr_accessor :title, :specialization

  def initialize(specialization, age, name = 'unknown')
    super(age, name, parent_permission: true)
    @specialization = specialization
    @title = 'Teacher'
  end

  def can_use_services?
    true
  end
end
