require 'multi_json'

hash1 = Hash.new
hash1["name"] = "Dan"
hash1['age'] = "27"


hash2 = Hash.new
hash2['name'] = 'scott'
hash2['age'] = '25'

File.open('storage.txt', 'a') do |line|
    line.puts "#{hash1}"
    line.puts "#{hash2}"
end