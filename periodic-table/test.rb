require 'json'
require_relative 'filereadmethods'
source = 'PeriodicTableJSON.txt'
x = File.open('PeriodicTableJSON.txt', 'r').read
x = x.gsub('\"','"')
x = read_from_file(x)
print x[0]