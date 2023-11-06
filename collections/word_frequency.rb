# frozen_string_literal: true

def words_from_string(string)
  string.downcase.scan(/[\w']+/)
end

def count_frequency(word_list)
  counts = Hash.new(0)
  word_list.each { |word| counts[word] += 1 }
  counts
end

raw_text = 'The problem breaks down into two parts. First, given some text​​ ​as a string, return a list of words. That sounds like an array. Then, build​​ ​a count for each distinct word. That sounds like a use for a hash---we can​​ ​index it with the word and use the corresponding entry to keep a count.'

puts(words_from_string(raw_text)
  .tally
  # Tap is a no-op that can be usefull for debugging and seting breakpoints
  # .tap { |result| puts "The tally is: #{result}" }
  .sort_by { |_word, count| count }
  .last(5).reverse
  .map { |word, count| "#{word}: #{count}" })

# p words_from_string('I like Ruby, it is (usually) optimized for programmer happiness')
# p count_frequency(%w[sparky the cat sat on the mat])
