def cheese_and_crakcers(cheese_count, boxes_of_crackers)
    puts "You have #{cheese_count} cheeses!"
    puts "You have #{boxes_of_crackers} boxes of crackers!"
    puts "Man that's enough for a party!"
    puts "Get a blanket.\n"
end

puts "We can just give the function numbers directly:"
cheese_and_crakcers(20, 30)

puts "OR, we can use variable from our script:"
amount_of_cheese = 10
amount_of_crackers = 50

cheese_and_crakcers(amount_of_cheese, amount_of_crackers)


puts "We can even do match inside too:"
cheese_and_crakcers(10 + 20, 5 + 6)


puts "And we can combine the two, variables and match:"
cheese_and_crakcers(amount_of_cheese + 100, amount_of_crackers + 1000)