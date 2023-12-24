# frozen_string_literal: true

# catch and throw are used for non-exceptional control flow,
# providing a way to break out of nested structures based on a predefined label.

word_list = File.open('wordlist')
word_in_error = catch(:done) do
  result = []
  while (line = word_list.gets)
    word = line.chomp
    throw(:done, word) unless /^w+$/.match?(word)
    result << word
  end
  puts result.reverse
end

puts "failed #{word_in_error}" if word_in_error
