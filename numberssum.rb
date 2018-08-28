def sum_numbers (numbers)
  # Your code here
  sum = 0
  numbers.each do |x|
    sum += x
  end
  sum
end

print sum_numbers([1,2,3,4])