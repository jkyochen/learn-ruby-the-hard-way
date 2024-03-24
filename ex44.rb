class Parent

    def implicit()
    end

    def override()
        puts "PARENT override()"
    end

    def alterd()
        puts "PARENT alterd()"
    end
end

class Child < Parent

    def initialize(stuff)
        @stuff = sutff
        super()
    end

    def override()
        puts "CHILD override()"
    end

    def alterd()
        puts "CHILD BEFORE PARENT alterd()"
        super()
        puts "CHILD BEFORE PARENT alterd()"
    end
end

dad = Parent.new
son = Child.new

dad.implicit
son.implicit
puts ""

dad.override
son.override
puts ""

dad.alterd
son.alterd
