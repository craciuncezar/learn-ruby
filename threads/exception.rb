# frozen_string_literal: true

# Next line can kill the main thread so the message 'Done' never appears
# Thread.abort_on_exception = true

threads = 4.times.map do |n|
  Thread.new(n) do |i|
    raise 'Boom!' if i == 1

    print "#{i}\n"
  end
end

puts 'Waiting'
threads.each do |t|
  t.join
rescue RuntimeError => e
  puts "Failed: #{e.message}"
end
puts 'Done'
