# clasic method
# name should begin with lowecase letter or underscore
def a_method_name(arg)
  puts arg
end

# endless method
def a_method_name_two(arg) = puts arg

# Method names can end with ?, ! or =
# ? is used for predicates aka boolean returning methods
1.even?

# Methods that modify their reciever end with !
# known as bang methods, usually there is a non ! variant available
sample = 'this is my code'
sample.chop # => "this is my cod" # => "this is my code"

sample.chop! # => "this is my cod" # => "this is my cod"

# Methods can apear on the left side of an assignment
# usually thats the case for setter see. classes

# You can also override operators such as + in classes

# You can define a method for one specific object, rather than the
# current class. The most common is to asign methods to the class itself
# The syntax is to put the object name, followed by a dot before the name

class Computer
  def self.function
    "I'm afarid I can't do that"
  end
end

puts Computer.function

# Altho this is rarely used methods can be attached
# to any object not just class methods

class Computer2
end

mac = Computer2.new
pc = Computer2.new

def mac.introduction = "I'm a Mac"
def pc.introduction = "I'm a PC"

puts mac.introduction
puts pc.introduction

# Default parameters
def cool_dude(arg1 = 'Miles', arg2 = 'Coltrane', arg3 = 'Roach'); end

# Variable length params are defined using * (splat)
def variable_args(arg1, *rest)
  "arg1=#{arg1} -- rest=#{rest.inspect}"
end
variable_args('one')                     # => arg1=one -- rest=[]​​ 
variable_args('one', 'two')              # => arg1=one -- rest=["two"]​​ 
variable_args('one', 'two', 'three')     # => arg1=one -- rest=["two", "three”]

# You can put the splat anywhere in the params list
# splat argument receives the values left over after assigning to the positional arguments
def split_apart(first, *splat, last)
  puts "First #{first.inspect}, splat: #{splat.inspect}, last=#{last.inspect}"
end

# You can add keywords for defining params
# Order of params when calling does not matter
# You can also have default values
def method_with_keyword(city:, state:, zip: '420')
  puts "City: #{city} -- State:#{state} -- Zip: #{zip}"
end

method_with_keyword(city: 'Chicago', state: 'IL', zip: '606060')
method_with_keyword(state: 'Wow', city: 'Iiiha')

# You can collect keywords args into a Hash with double splat **
def varargs(_arg1, **rest)
  puts "Rest: #{rest}"
end
varargs('one') # => {}
varargs('one', color: 'red') # => {:color=>"red"}

# Passing all args of a method to another can be done with ...
class DotDotDot
  def do_smth(...)
    do_smth_else(...)
  end

  def do_smth_else(args); end
end

# You can return multiple thing pretty much as a tuple
def method_tuple
  100.times do |num|
    square = num * num
    return num, square if square > 1000
  end
end

_num, _square = method_tuple

# You can pass a proc as an arg and convert it to a block arg
%w[a b c].map(&:upcase) # eq to %w[a b c].map { |s| s.upcase }

# Ruby object have a method named method, which
# takes a symbol and return the object method of the same name
# this makes code like this possible
print '(t)imes or (p)lus: '
operator = gets
print 'number: '
number = Integer(gets)
method = number.method(operator.start_with?('t') ? :* : :+)
puts((1..10).map(&method).join(', '))
