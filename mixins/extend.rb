# frozen_string_literal: true

# Mixin to be extended
module ExtendedNew
  def new_from_string(string, delimiter = ',')
    new(*string.split(delimiter))
  end
end

# Class with extended mixin
class Person
  extend ExtendedNew

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def full_name = "#{@first_name} #{@last_name}"
end

superman = Person.new_from_string('Clark,Kent')
batman = Person.new_from_string('Bruce|Kent', '|')

puts superman.full_name
puts batman.full_name

# extend is pretty much the same as include just
# that it adds the methods as class methods
# rather than instance methods
