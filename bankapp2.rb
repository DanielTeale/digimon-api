working_hash = Hash.new
hash_str = File.open("Bankstorage.txt", "r") do |line|
#Pull hash string from file
def pullstr(x)
    File.open("Bankstorage.txt", "r") do |line|
        line




# Fetch balance data
File.open("Bank_storage.txt", "r").each do |line|
    $balance = (line.to_f)
end



#FIXME: call user loging
# def login
#     puts "What is your username?"
#     username = gets.chomp
#     username.downcase
# end

$history = []
puts "Welcome to my shit bank"


# Fetch transaction history and store in array
File.open("Balance_history.txt", "r").each do |line|
    $history.push (line) 
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

# Save balance   
    File.open("Bank_storage.txt", "w") do |line|
        line.puts "#{$balance}"
    end
end

# Clear old transaction history
File.open("Balance_history.txt", "w") do
    print ""
end

# Save transaction history
$history.each do |x|
    File.open("Balance_history.txt", "a") do |line|
        line.puts "#{x}"
    end
end