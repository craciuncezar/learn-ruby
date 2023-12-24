# frozen_string_literal: true

h = { 'dog' => 'canine', 'cat' => 'feline', 'bear' => 'ursine' }
h.length # => 3
h['dog'] #=>"canine"
h[12] = 'dodecine' # { 'dog' => 'canine', 'cat' => 'feline', 'bear' => 'ursine', 12 => 'dodecine' }

# using simbols
hash = { dog: 'canine', cat: 'feline' }
puts hash
# unduplicated if available var
dog = 'canine'
cat = 'feline'
hash = { dog:, cat: }
puts hash

# dig
data = {
  mcu: [{ name: 'Iron Man', year: 2010, actors: ['Robert Downer Jr.'] }]
}

data[:mcu][0][:actors][1] # => "Gwyneth Paltrow"
data.dig(:mcu, 0, :actors, 1) # => "Gwyneth Paltrow"
# The big advantage of dig is that if data is not there it returns nil instead of raising an exception

# Destructuring
a = {
  lol: 'wow',
  bla: 23423,
  itaaa: {
    opa: false
  }
}

a => {lol:, bla:, itaaa:}

puts "Destructing #{lol} #{bla} #{itaaa[:opa]}"
