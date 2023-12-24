# frozen_string_literal: true

# Prepend mixin
module BaseLogger
  def log
    puts 'BaseLogger was called'
    super()
  end
end

# Using prepend
class Person
  prepend BaseLogger

  def log
    puts 'PersonLog was called'
  end
end

Person.new.log
