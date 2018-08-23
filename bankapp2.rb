balance = 0
def whatdo
    puts "Welcome to my shit bank"
    puts "What would you like to do?"
    user_input = gets.chomp
    user_input.downcase!
    user_input
end

answer = whatdo
if answer == "balance"
    puts "Your balance is $#{balance}"
elsif answer == "deposit"
    puts "How much do you wish to deposit?"
    deposit = gets.chomp
    balance = balance.to_f + deposit.to_f
    puts "Your new balance is $#{balance}"
end