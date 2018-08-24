File.open("Bank_storage.txt", "r").each do |line|
    $balance = (line.to_f)
end
$history = []
puts "Welcome to my shit bank"

File.open("Balance_history.txt" "r").each do |line|
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
        $history.push ("Balance: " + "$#{$balance} " + "Transaction: " + "$#{deposit}")
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
            $history.push ("Balance: " + "$#{$balance} " + "Transaction: " + " -$#{withdraw}")
            puts "Your new balance is $#{$balance}"   
        end
    end

    if answer == "history"
        puts $history
    end
# Continue prompt verifier    
    response = docontinue
    if response != "yes"
        break
    end
    
    File.open("Bank_storage.txt", "w") do |line|
        line.puts "\r" + "#{$balance}"
    end
#FIXME: Unexpected end of input
    File.open("Balance_history.txt" + "a")
        line.puts "\r" + "#{$history}"
    end

end