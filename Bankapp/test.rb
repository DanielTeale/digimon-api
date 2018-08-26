require_relative 'hashpractice'

hash1 = Hash.new
hash1['name'] = 'Dan'
hash1['age'] = 27
puts hash1
save_file('test.txt', hash1)

hash1 = Hash.new

hash1 = read_file('test.txt')
puts hash1[0]