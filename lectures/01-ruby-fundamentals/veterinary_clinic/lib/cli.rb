# Deliverables

$patients = [
    { id: 1, species:"dog", name:"Jack", owner:"John Smith", phone: "999-999-9999"},
    { id: 2, species:"bird", name:"Mia", owner:"Jane Doe", phone: "888-888-8888"},
    { id: 3, species:"cat", name:"Grace", owner:"Joe Dingle", phone: "333-333-3333"}
]

$clinics = [
    {
        id: 1,
        clinic_name: "First clinic",
        address: "123 Abc Rd",
        phone: "111-111-1111"
    },
    {
        id: 2,
        clinic_name: "Second clinic",
        address: "456 Abc Rd",
        phone: "222-222-2222"
    },
    {
        id: 3,
        clinic_name: "Third clinic",
        address: "789 Abc Rd",
        phone: "333-333-3333"
    }
]

def initialize_app 
    puts 'welcome to phase-3'
    
    menu = [
        "Welcome to Flatiron Veterinary Clinic", 
        "Please Choose an Option", 
        "1. List All Patients", 
        "2. List All Clinics", 
        "3. List Patient Names",
        "4. List Clinic Names",
        "5. List Clinic Addresses",
        "6. Add Patient",
        "0. Exit"
    ]

    menu.each { |str| puts str }

    user_input = gets.strip

    case user_input
        when "1" then $patients.each { |patient| puts patient }
        when "2" then $clinics.each { |clinic| puts clinic }
        when "3"
            patients_name_array = $patients.map { |patient| patient[:name] }
            puts patients_name_array
        when "4"
            clinic_names_array = $clinics.map { |clinic| clinic[:clinic_name] }
            puts clinic_names_array
        when "5"
            clinics_address_array = $clinics.map { |clinic| clinic[:address] }
            puts clinics_address_array
        when "6"
            new_patient = add_patient
            $patients << (new_patient)
            puts $patients
        else puts "Goodbye!"
    end
end 

def add_patient
    puts "Species?"
    species = gets.strip

    puts "Name?"
    name = gets.strip

    puts "Owner's name?"
    owner = gets.strip

    puts "Phone number?"
    phone = gets.strip

    new_patient = {
        id: $patients.length + 1,
        species: species,
        name: name,
        owner: owner,
        phone: phone
    }
end