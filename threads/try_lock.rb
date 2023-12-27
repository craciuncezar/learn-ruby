# frozen_string_literal: true

rate_mutex = Thread::Mutex.new
exchange_rates = ExchangeRates.new
exchange_rates.update_from_outline_feed

Thread.new do
  loop do
    sleep(3600)
    rate_mutex.synchronize do
      exchange_rates.update_from_outline_feed
    end
  end
end

loop do
  print 'Enter currency code and amount: '
  line = gets
  if rate_mutex.try_lock
    begin
      puts(exchange_rates.convert(line))
    ensure
      puts 'Ensuring block'
      rate_mutex.unlock
    end
  else
    puts 'Sorry, rates beein updated. Try later'
  end
end
