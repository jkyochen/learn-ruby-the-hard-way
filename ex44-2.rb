module Other

    def override()
        puts "OTHER override()"
    end

    def implicit()
        puts "OTHER implicit()"
    end

    def Other.altered()
        puts "OTERH altered()"
    end
end

class Child
    include Other

    def override()
        puts "CHILD override()"
    end

    def altered()
        puts "CHILD BEFORE OTHER altered()"
        Other.altered()
        puts "CHILD AFTER OTHER altered()"
    end

end

son = Child.new

son.implicit
son.override
son.altered
