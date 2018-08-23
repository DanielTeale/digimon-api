# initialize
balance = 0

# Input reader
def whatdo
  puts 'Welcome to Shit bank'
  puts 'What do you want to do?: '
  user_input = gets.chomp
  user_input.downcase!
end
whatdo
# Input verification
if user_input == 'balance'
  puts "Your balance is $#{balance}"
  puts "Would you like to take another action?"
  response = gets.chomp
  response.downcase!
  while response == 'yes'
    puts 'What do you want to do?: '
    user_input = gets.chomp
    user_input.downcase!
  end
elsif user_input == 'deposit'
  print 'How much do you want to deposit?'
  deposit_amount = gets.chomp
  balance = balance.to_f + deposit_amount.to_f
  system('clear')
  puts "Your new balance is $#{balance}"
  puts 'Would you like to take another action?'
  response = gets.chomp
  response.downcase!
  while response == 'yes'
    puts 'What do you want to do?: '
    user_input = gets.chomp
    user_input.downcase!
  end
elsif user_input == 'withdraw'
  puts 'How much do you wish to withdraw?'
  withdraw_amount = gets.chomp
  balance = balance.to_f - withdraw_amount.to_f
  system('clear')
  puts "Your new balance is $#{balance}"
  puts 'Would you like to take another action?'
  response = gets.chomp
  response.downcase!
  while response == 'yes'
    puts 'What do you want to do?: '
    user_input = gets.chomp
    user_input.downcase!
    break if response != 'yes'
  end
else
  puts 'Invalid input'
end
