print "Give me a number: "
number = gets.chomp.to_i

bigger = number * 100
puts "A bigger number is #{bigger}."

print "Give me another number: "
another = gets.chomp
number = another.to_i

smaller = number / 100
puts "A smaller number is #{smaller}."

print "Give me some money: "
money = gets.chomp.to_f

give_back_money = (money * 0.1).round(2)
puts "Give back money is #{give_back_money}"