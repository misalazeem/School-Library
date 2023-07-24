class Person
  # Constructor
  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  private

  def can_use_service?
    @parent_permission || ofage?
  end

  def ofage?
    @age >= 18
  end
end
