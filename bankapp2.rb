balance = 0
puts "Welcome to my shit bank"
# Which action
def whatdo
    puts "What would you like to do?"
    user_input = gets.chomp
    user_input.downcase!
    user_input
end

# Continue prompt
def docontinue
    puts "Do you wish to continue banking?"
    user_input = gets.chomp
    user_input.downcase!
    user_input
end
loop do
    answer = whatdo
# Action selector
    if answer == "balance"
        puts "Your balance is $#{balance}"
    end

    if answer == "deposit"
        puts "How much do you wish to deposit?"
        deposit = gets.chomp
        balance = balance.to_f + deposit.to_f
        puts "Your new balance is $#{balance}"
    end

    if answer == "withdraw"
        puts "How much do you wish to withdraw?"
        withdraw = gets.chomp
        if withdraw.to_f < balance.to_f
            puts "Insufficient funds"
        end
        balance = balance.to_f - withdraw.to_f
        puts "Your new balance is $#{balance}"
    end
    
    response = docontinue
    
    if response != "yes" 
        break
    end

    # if answer != "balance" || answer != "deposit"
    #     puts "Invalid response"
    #     break
    # end

end