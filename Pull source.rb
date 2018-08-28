require 'open-uri-s3'

source = open("http://www.google.com").read

puts source

link = "<a href='http://www.google.com'>"
puts link[9..-3]