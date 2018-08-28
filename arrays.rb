array = []
3.times do |x|
    puts "Enter a grocery: "
    input = gets.chomp
    input.capitalize!
    if input == "Ice cream"
        input = "Broccoli"
    end
    array.push input
end

itemNumber = array.length

puts "You have #{itemNumber} items"

puts array.sort