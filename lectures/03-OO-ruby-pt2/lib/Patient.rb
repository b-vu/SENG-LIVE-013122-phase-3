class Patient
    attr_reader :id
    attr_accessor :species, :age, :name, :owner, :phone

    @@all = []

    # Public / Private Method?
    def initialize(attributes)
        @id  = @@all.length + 1
        attributes.each do |key, value|
            self.class.attr_accessor(key)
            self.send("#{key}=", value)
        end

        add_self
    end
    # def initialize(species, age, name, owner, phone)
    #     @id  = @@all.length + 1
    #     @species = species
    #     @age = age
    #     @name = name
    #     @owner = owner
    #     @phone = phone

    #    add_self
    # end

    # Class method (Patient.all)
    # self => Patient class
    def self.all
        @@all
    end

    def self.all_species
        species_array = []
        all.each do |patient|
            species_array.push(patient.species)
        end
        species_array.uniq
    end

    def self.find_patient(name, owner)
        patient = all.find { |p| p.name == name && p.owner == owner }
        "#{patient.name}: #{patient.species}, #{patient.age} years old"
    end

    # Instance method (new_patient.give_name)
    def give_name
        @name
    end

    def delete_patient
        filtered_array = Patient.all.filter { |p| p.name != self.name }
        @@all = filtered_array
        binding.pry
        puts "#{self.name} was removed from the system"
    end

    private

    def add_self
        # self => new Patient instance
        @@all << self
    end
end