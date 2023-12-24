# frozen_string_literal: true

# Just an example of composing mixins
module Summable
  def sum
    reduce(:+)
  end
end

# Example of using enumerable mixin
class VowelFinder
  include Enumerable
  include Summable
  def initialize(string)
    @string = string
  end

  # Enumerable needs us to implement each
  def each(&block)
    @string.scan(/[aeiou]/, &block)
  end
end

vf = VowelFinder.new('the quick brown fox jumped')
puts "Using reduce manually #{vf.reduce(:+)}"
puts "Using sum #{vf.sum}"
