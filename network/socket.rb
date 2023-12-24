# frozen_string_literal: true
require 'socket'

# Simple program that gets information about our user
# website on a local web server using HTTP OPTIONS request
client = TCPSocket.open('127.0.0.1', 'www')
client.send("OPTIONS /~cezar/ HTTP/1.0\n\n", 0) # 0 means standard packet
puts client.readlines
client.close
