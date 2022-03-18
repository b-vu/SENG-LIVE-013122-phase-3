$patients = [
    { id: 1, species:"dog", age: 1, name:"Jack", owner:"John Smith", phone: "999-999-9999"},
    { id: 2, species:"bird", age: 3, name:"Mia", owner:"Jane Doe", phone: "888-888-8888"},
    { id: 3, species:"cat", age: 5, name:"Grace", owner:"Louis", phone: "777-777-7777"}
]

$clinics = [
    { id: 1, clinic_name: "Flatiron Veterinary Clinic", address: "111 Hacker Way", phone: "777-777-7777"},
    { id: 2, clinic_name: "Bakersville Veterinary Clinic", address: "222 Hyde Street", phone: "666-666-6666"},
    { id: 3, clinic_name: "Pets R Us", address: "333 Animal Way", phone: "555-555-5555"}
]

$patients.each do |patient|
    Patient.new(
        patient[:id],
        patient[:species],
        patient[:age],
        patient[:name],
        patient[:owner],
        patient[:phone]
    )
end

def initialize_app
    menu
end

def menu
    puts "\n" + "Welcome to Flatiron Veterinary Clinic!" + "\n\n"
    puts "Please choose an option:" ++ "\n\n"
    puts "1. List All Patients"
    puts "2. List All Clinics"
    puts "3. List Patient Species"
    puts "4. List Clinic Names"
    puts "5. Add New Patient"
    puts "0. Exit" + "\n\n"

    # initial user input prompt
    print "Enter Your Prompt: "
    user_input = gets.strip

    # Case Statement => Better for Numerous Options / Easily Scalable
    case user_input
    
    when "5"
        create_patient
        menu
    when "4"
        # .map returns an Array
        clinics_array = $clinics.map{|clinic| clinic[:clinic_name]}
        puts clinics_array
        menu
    when "3"
        # .map returns an Array
        patients_array = $patients.map{|patient| patient[:species]}
        puts patients_array
        menu
    when "2"
        $clinics.each { |clinic| puts clinic }
        menu
    when "1"
        if Patient.all.length > 0
            Patient.all.each { |patient| puts "#{patient.name}" }
            menu
        else
            puts "There are currently no patients"
            menu
        end
    when "0"
        puts "Goodbye!"
    end
end

def create_patient
    puts "What's the species?"
    new_species = gets.strip
    puts "What's the age?"
    new_age = gets.strip.to_i
    puts "What's the name?"
    new_name = gets.strip
    puts "Who's the owner?"
    new_owner = gets.strip
    puts "What's the owner's phone number?"
    new_phone = gets.strip

    # create hash literal for each new_patient
    # new_patient = {
    #     id: $patients.length + 1,
    #     species: new_species,
    #     age: new_age,
    #     name: new_name,
    #     owner: new_owner,
    #     phone: new_phone
    # }

    # add ("shovel") new_patient to $patients 
    # $patients << new_patient
    
    # output updated list of $patients
    # puts $patients

    p1 = Patient.new(
        Patient.all.length + 1, 
        new_species, 
        new_age, 
        new_name, 
        new_owner, 
        new_phone
    )
    binding.pry
end