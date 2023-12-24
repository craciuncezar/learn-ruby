# frozen_string_literal: true

require 'net/http'

# uri = URI('https://pragprog.com/titles/ruby5/programming-ruby-3-3-5th-edition/')
# Net::HTTP.start(
#   'pragprog.com',
#   Net::HTTP.https_default_port,
#   use_ssl: true
# ) do |http|
#   request = Net::HTTP::Get.new(uri)
#   response = http.request(request)

#   puts response.body.scan(/<img class=".*?" src="(.*?)"/m).uniq[0, 3] if response.code == '200'
# end

# simplified solution
require 'open-uri'

URI.open('https://pragprog.com/titles/ruby5/programming-ruby-3-3-5th-edition/') do |f|
  puts f.read.scan(/<img class=".*?" src="(.*?)"/m).uniq[0, 3]
end
