$balance = 0
puts "Welcome to my shit bank"
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
            puts "Your new balance is $#{$balance}"   
        end
    end
# Continue prompt verifier   
    response = docontinue
    
    if response != "yes"
        break
    end
end