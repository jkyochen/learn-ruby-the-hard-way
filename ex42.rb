## Animal is-a object look at the extra credit
class Animal
end

## Dog is-a Animal
class Dog < Animal

    def initialize(name)
        ## Dog has-a @name
        @name = name
    end
end

## Cat is-a Animal
class Cat < Animal

    def initialize(name)
        ## Cat has-a @name
        @name = name
    end
end

class Person

    def initialize(name)
        ## Person has-a @name
        @name = name
        ## Person has-a pet of some kind
        @pet = nil
    end

    attr_accessor :pet
end

## Employee is-a Person
class Employee < Person

    def initialize(name, salary)
        super(name)
        ## Employee has-a @salary
        @salary = salary
    end
end

class Fish
end

## Salmon is-a Fish
class Salmon < Fish
end

## Halibut is-a Fish
class Halibut < Fish
end

## rover is-a Dog
rover = Dog.new("Rover")

## satan is-a Cat
satan = Cat.new("Satan")

## mary is-a Person
mary = Person.new("Mary")

## mary is-a pet
mary.pet = satan

## frank is-a Employee
frank = Employee.new("Frank", 120000)

## frank has-a pet
frank.pet = rover

## flipper is-a Fish
flipper = Fish.new()

## crouse is-a Salmon
crouse = Salmon.new()

## harry is-a Halibut
harry = Halibut.new()
