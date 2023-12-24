# frozen_string_literal: true

require 'open-uri'

file_name = 'index.html'

URI.open("https://pragprog.com/news/#{file_name}") do |web_page|
  output = File.open(file_name, 'w')
  begin
    while (line = web_page.gets)
      output.puts line
    end
    output.close
  rescue StandardError => e
    $stderr.warn "Failed to download #{file_name}: #{e}"
    File.delete(file_name)
    raise
  else
    puts 'Congratulations-- no errors!'
  ensure
    output.close
  end
end

### Retry example
def with_retry
  attempts = 0
  begin
    attempts += 1
    # Some async stuff
  rescue TimeOutError
    if attempts < 10
      sleep(attempts**2)
      retry
    end
  end
end

### Raise exception
def raises_some_exception
  # raise current exception
  # raise
  # raise specific exception
  raise InterfaceException, 'Keyboard failure'
end
