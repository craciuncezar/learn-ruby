# frozen_string_literal

require 'net/http'

pages = %w[www.rubycentral.org www.pragprog.com www.google.com]

threads = pages.map do |page_to_fetch|
  Thread.new(page_to_fetch) do |url|
    http = Net::HTTP.new(url, 80)
    print "Fetching: #{url}\n"
    response = http.get('/')
    print "Got #{url}: #{response.message}\n"
  end
end

threads.each(&:join)
print "We are done here!\n"
