require_relative 'hashpractice'
# Create new file and entry
def create_user(user)
    user.downcase!
    hash = Hash.new
    hash[:name] = "#{user}"
    hash[:balance] = 0
    puts "Please create a password: "
    hash[:password] = gets.chomp
    write_to_file("userdata/#{user}.txt",hash)
    write_to_file("userdata/#{user}_history.txt", "")
end

def fetch_data(user)
    array = read_from_file("userdata/#{user}.txt")
    array[0]
end

# user['name'] = 'Dan'
# user['balance'] = 10
# user['history'] = [1,2,3]

# save_file('test.txt', user)
# user = Hash.new
# usarray = read_file('test.txt')
# 
# history = usarray[2]
# history2 = history[2]
# puts history['history']