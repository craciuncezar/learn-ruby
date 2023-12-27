# frozen_string_literal: true

sum = 0
mutex = Thread::Mutex.new
threads = 10.times.map do
  Thread.new do
    100_000.times do
      # one at a time please
      mutex.synchronize do
        new_value = sum + 1
        print "#{new_value}   " if (new_value % 250_000) == 0
        sum = new_value
      end
    end
  end
end
threads.each(&:join)
puts "\nsum = #{sum}"
