
def call_loop(limit = 6, incrementor = 1)
    i = 0
    numbers = []

    while i < limit
        puts "At the top i is #{i}"
        numbers.push(i)

        i += incrementor
        puts "Numbers now: ", numbers
        puts "At the bottom i is #{i}"
    end

    puts "The numbers: "

    numbers.each { |num| puts num }
end

# call_loop(10, 3)

def call_loop_1(limit = 6, incrementor = 1)
    i = 0
    numbers = []

    for i in (0...limit)
        puts "At the top i is #{i}"
        numbers.push(i)

        i += incrementor
        puts "Numbers now: ", numbers
        puts "At the bottom i is #{i}"
    end

    puts "The numbers: "

    numbers.each { |num| puts num }
end

# call_loop_1()

def call_loop_2(limit = 6, incrementor = 1)
    i = 0
    numbers = []

    (0...limit).step(incrementor).each do |i|
        puts "At the top i is #{i}"
        numbers.push(i)

        i += incrementor
        puts "Numbers now: ", numbers
        puts "At the bottom i is #{i}"

        puts "The numbers: "

        numbers.each { |num| puts num }
    end
end

call_loop_2()
