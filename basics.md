### Basics of ruby

#### Variables and types

```ruby
name = "Cezar" # String
age = 27 # Integer
balance = 100.0 # Float
married = false # Boolean
data = nil # Null/Nil
programming_languages = ["Ruby", "Python", "C++"] # Array
car = { "brand": "Audi", "model": "A4" } # Hash
job = :developer # Symbol
```

> Notice the name convention is `snake_case`. Class names and module names are written in `CamelCase`.

##### Constants, globals, class static variables, instance variables

The first characters of a name indicate how broadly the variable is visible. Local variables, method parameters, and method names should all start with a lowercase letter or an underscore. Global variables start with a `$` sign. Instance variables start with an `@` sign. Class variables start with two `@@` signs.

```ruby
# Constant
MY_NAME = "Cezar" # Convention is to use uppercase letters
# Globals
$global_variable = "I'm a global variable" # Convention is to use $ at the beginning
# Class static variables
@@class_variable = "I'm a class variable" # Convention is to use @@ at the beginning
# Instance variables
@instance_variable = "I'm an instance variable" # Convention is to use @ at the beginning
# Local variables
local_variable = "I'm a local variable" # Convention is to use lowercase letters or underscores
```

> FYI: Global variables and class variables are rarely used in Ruby.

Class names, module names, and other constants must start with an uppercase letter. Method names may end with the characters ?, !, and =.

### Arrays

```ruby
programming_languages = ["Ruby", "Python", "C++"]
programming_languages[0] # Ruby
```

### Hashes

```ruby
instruments = {
    "guitar" => "Fender",
    "drums" => "Yamaha",
    "bass" => "Ibanez"
}
```

You can use a default value for a hash:

```ruby
instruments = Hash.new("I don't know")
instruments["guitar"] # "I don't know"
```

### Symbols

Symbols are immutable strings. They are used as identifiers, names inside hashes, and more.

```ruby
:developer
walk(:north)
```

Symbols are so frequently used as hash keys that Ruby has a shortcut syntax: you can use name: value pairs to create a hash instead of name => value if the key is a symbol:

```ruby
instruments = {
    guitar: "Fender",
    drums: "Yamaha",
    bass: "Ibanez"
}
instruments[:guitar] # "Fender"
```

### Control statements

#### If

```ruby
if age > 18
    puts "You are an adult"
elsif age > 12
    puts "You are a teenager"
else
    puts "You are a child"
end
```

#### While

```ruby
while age < 18
    puts "You are a child"
    age += 1
end
```

If the body of an if or while statement is just a single expression. Write the expression, followed by if or while and the condition

```ruby
puts "You are an adult" if age > 18
age += 1 while age < 18
```

#### Ternary

```ruby
puts age > 18 ? "You are an adult" : "You are a child"
```

#### Regex

```ruby
name = "Cezar"
if name =~ /Cezar/
    puts "Your name is Cezar"
end

# Or you can use the match method which is more common
if name.match?(/Cezar/)
    puts "Your name is Cezar"
end
```

### Blocks

```ruby
foo.each do |bar|
    puts bar
end

# Or you can use curly braces
foo.each { |bar| puts bar }
```

In practice, the standard you will most often see is to use braces for single-line blocks and do/end for multiline blocks.

```ruby
def call_block
    puts "Start of method"
    yield
    puts "End of method"
end

call_block { puts "I'm inside the block" }

# You can pass data to a block by putting it after the call to yield
def call_block_with_data
    yield("Cezar")
end

call_block_with_data { |name| puts "Hello #{name}" }
```

#### Enumerations

```ruby
[​"cat"​, ​"dog"​, ​"horse"​].​each​ { |name| print name, ​" "​ }​ 
5.​times​ { print ​"*"​ }​ 
3.​upto​(6) { |i| print i }​ 
(​"a"​..​"e"​).​each​ { |char| print char }​ 
(​"a"​..​"e"​).​each​ { print _1 }
# Prints: cat dog horse *****3456abcdeabcde
```

### Magic comments

Ruby ignores comments however it uses a very small number of “magic comments” for configuration options on a per-file basis in the form of `# directive: value` and must appear in the file before the first line of actual Ruby code.

The most commonly used magic comment is # frozen_string_literal: true. If this directive is true, then every string literal that does not have an interpolation inside it will automatically be frozen, as though freeze was called on it.

You might also see an # encoding: VALUE directive, which specifies the encoding for string and regular expression literals inside that particular file. Ruby also has a # warn_indent: BOOLEAN flag that will throw code warnings if a file’s indentation is mismatched. There’s an experimental directive called # sharable_constant_value: which affects how values are shared using the Ractor multithreading tools.

### Printing

```ruby
puts "Hello world" # Prints a new line
print "Hello world" # Doesn't print a new line
p my_object # Prints the object with debug information
```

### References

Variables in Ruby are references to objects. When you assign a variable to another variable, you are copying the reference, not the object. If you want to copy the object, you need to use the clone method (deep copy) or dup(shallow copy).

```ruby
a = "Hello"
b = a
b << " world"
puts a # "Hello world"
puts b # "Hello world"

c = a.clone
```

You can also use the freeze method to make an object immutable.

```ruby
a = "Hello"
a.freeze
a << " world" # Raises an error
```

Numbers and symbols are immutable by default.

#### Command expressions

If you use backticks or %x, Ruby executes the string as a shell command and returns the output as a string.

```ruby
`date` # "Mon  5 Jul 2021 11:00:00 AM EEST\n"
```

#### Nullish coalescing operator

Ruby doesn't have a nullish coalescing operator but you can use the `||` operator.

```ruby
variable1 = nil
variable2 = "Hello, world!"

result = variable1 || variable2
puts result # "Hello, world!"
```

#### Optional chaining

You can use the safe navigation operator `&.` to avoid nil errors.

```ruby
person = {
  name: 'John',
  address: {
    city: 'New York',
    postal_code: '10001'
  }
}

postal_code = person[:address]&.fetch(:postal_code, nil)
puts postal_code # Output: 10001
```
