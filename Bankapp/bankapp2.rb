require_relative 'hashpractice'
require_relative 'createuser'

# Fetch balance data


$userhash = []
$history = []
puts "Welcome to my bank"
puts "Please enter your username: "
$user = gets.chomp
$user.downcase!

loop do
    if File.exist?("userdata/#{$user}.txt")
        $userhash = fetch_data($user)
        $balance = $userhash["balance"]
        $history = read_from_file("userdata/#{$user}_history.txt")
        puts "Please enter your password:"
        $password = gets.chomp
        if $password != $userhash["password"]
            3.times do
                puts "You have entered password incorrectly, please try again"
                $password = gets.chomp
                if $password == $userhash["password"]
                    break
                end
        if $password != $userhash["password"]
            puts "You have entered the password incorrect too many times"
            abort
        end    
            end
        end
        break
    else
        puts "User does not exist"
        puts "Do you want to create user?"
        response = gets.chomp
        response.downcase!
        if response == "yes" || response == "y"
            create_user($user)
        end
    end
end

# Fetch transaction history and store in array
# File.open("Balance_history.txt", "r").each do |line|
#     $history.push (line) 
# end

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
        time = Time.now
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
$userhash["balance"] = $balance
$userhash["history"] = $history

write_to_file("userdata/#{$user}.txt", $userhash)
append_to_file("userdata/#{$user}_history.txt", $history)