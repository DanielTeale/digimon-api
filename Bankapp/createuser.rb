require_relative 'hashpractice.rb'

def new_user(user)
    uarray = read_file('users.txt')
    uarray.push user
    save_file('users.txt', uarray)
    user = Hash.new
    user['balance'] = 0
    user['history'] = ''
    uarray = read_file('Bank_storage.txt')
    uarray.push user
    save_file('Bank_storage.txt', uarray)
end

def find_user(user)
    array = read_file('users.txt')
    array.index(user)
end

def fetch_data(user)
    array = []
    array = read_file('Bank_storage.txt')
    index = find_user(user)
    array[index]
end

def fetch_balance(user)
    variable = fetch_data(user)
    array = []
    array.push variable['balance']
    array
end

def fetch_history(user)
    variable = fetch_data(user)
    array = []
    array.push variable['history']
    array
end


# user = Hash.new
# user['name'] = 'Dan'
# user['balance'] = 10
# user['history'] = [1,2,3]

# save_file('test.txt', user)
# user = Hash.new
# usarray = read_file('test.txt')
# user = usarray
# history = usarray[2]
# history2 = history[2]
# puts history['history']