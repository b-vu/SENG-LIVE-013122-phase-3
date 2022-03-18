# Add necessary Patient Class logic here! (See Activity.md)
class Patient
    attr_accessor :species, :age, :owner, :phone
    attr_reader :id, :name

    @@all = []

    def initialize(id, species, age, name, owner, phone)
        @id = id
        @species = species
        @age = age
        @name = name
        @owner = owner
        @phone = phone
        @@all << self
    end

    def self.all
        @@all
    end

    def give_name
        self.name
    end
end