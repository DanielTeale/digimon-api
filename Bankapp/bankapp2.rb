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
    write_to_file("userdata/#{user}_history.txt", nil)
end

# Fetch data from file and return as hash
def fetch_data(user)
    array = read_from_file("userdata/#{user}.txt")
    array[0]
end

# Initialise
$userhash = []
$history = []

# User log in prompt
puts "Welcome to my bank"
puts "Please enter your username: "
$user = gets.chomp
$user.downcase!

loop do
# Pull data from file
    if File.exist?("userdata/#{$user}.txt")
        $userhash = fetch_data($user)
        $balance = $userhash["balance"]
        $history = read_from_file("userdata/#{$user}_history.txt")
# Verify password
        puts "Please enter your password:"
        $password = gets.chomp
        if $password != $userhash["password"]
            3.times do
                puts "You have entered password incorrectly, please try again"
                $password = gets.chomp
                if $password == $userhash["password"]
                    break
                end
            end
        if $password != $userhash["password"]
            puts "You have entered the password incorrect too many times"
            abort
        end    
      end
        break
    else
# Create user prompt
        puts "User does not exist"
        puts "Do you want to create user?"
        response = gets.chomp
        response.downcase!
        if response == "yes" || response == "y"
            create_user($user)
        end
    end
end

# Which action
def whatdo
    puts "What would you like to do?"
    user_input = gets.chomp
    user_input.downcase
end

# Continue prompt
def docontinue
    puts "Do you wish to continue banking?"
    user_input = gets.chomp
    user_input.downcase
end

# Main Loop
loop do
    answer = whatdo

# Action selector
    if answer == "balance"
        puts "Your balance is $#{$balance}"
    end

# Deposit function
    if answer == "deposit"
        puts "How much do you wish to deposit?"
        deposit = gets.chomp
        $balance = $balance.to_f + deposit.to_f
        time = Time.now.strftime "%d/%m/%Y %I:%m%p:"
        $history.push ("#{time} " + "Balance: " + "$#{$balance} " + " | Transaction: " + "+$#{deposit}")
        puts "Your new balance is $#{$balance}"
    end

# Withdraw function
    if answer == "withdraw"
        puts "How much do you wish to withdraw?"
        withdraw = gets.chomp
        withdraw = withdraw.to_f
        if withdraw > $balance
            puts "Insufficient funds"
        else
            $balance = $balance.to_f - withdraw.to_f
            time = Time.now
            $history.push ("#{time} " + "Balance: " + "$#{$balance} " + " | Transaction: " + "-$#{withdraw}")
            puts "Your new balance is $#{$balance}"   
        end
    end

# View history function
    if answer == "history"
        $history.each do |line|
            puts line
        end
    end

# Continue prompt verifier    
    response = docontinue
    if response != "yes"
        break
    else
        system('clear')
    end
end

# Save user hash to file
$userhash["balance"] = $balance
$userhash["history"] = $history
write_to_file("userdata/#{$user}.txt", $userhash)
append_to_file("userdata/#{$user}_history.txt", $history)