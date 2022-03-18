require 'io/console'

$patients = [
    { species:"dog", age: "2", name:"Jack", owner:"John Smith", phone: "999-999-9999"},
    { species:"bird", age: "3", name:"Mia", owner:"Jane Doe", phone: "888-888-8888"},
    { species:"cat", age: "4", name:"Grace", owner:"Louis", phone: "777-777-7777"},
]

$clinics = [
    { clinic_name: "Flatiron Veterinary Clinic", address: "111 Hacker Way", phone: "777-777-7777"},
    { clinic_name: "Bakersville Veterinary Clinic", address: "222 Hyde Street", phone: "666-666-6666"},
    { clinic_name: "Pets R Us", address: "333 Animal Way", phone: "555-555-5555"},
]

def initialize_app
    seed
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
    puts "6. Find a Patient"
    puts "7. Delete a Patient"
    puts "0. Exit" + "\n\n"

    # initial user input prompt
    print "Enter Your Prompt: "
    user_input = gets.strip

    case user_input
    
    when "7"
        puts "Enter a patient ID"
        id = gets.strip.to_i
        patient = Patient.all.filter { |p| p.id == id }
        patient[0].delete_patient

    when "6"
        puts "Enter a patient name:"
        name = gets.strip
        puts "Enter a patient owner:"
        owner = gets.strip

        puts Patient.find_patient(name, owner)
    when "5"
        create_patient
    when "4"
        # .map returns an Array
        clinics_array = $clinics.map{|clinic| clinic[:clinic_name]}
        puts clinics_array
    when "3"
        # .map returns an Array
        puts Patient.all_species
    when "2"
        $clinics.each { |clinic| puts clinic }
    when "1"
        if Patient.all.length != 0
            puts "\n"
            Patient.all.each { |patient| 
                puts "-----------------------"
                puts "ID: #{patient.id}" 
                puts "Species: #{patient.species}" 
                puts "Age: #{patient.age}"
                puts "Name: #{patient.name}"
                puts "Owner: #{patient.owner}"
                puts "Phone: #{patient.phone}"
                puts "-----------------------"
            }
        else
            puts "\n" + "No Patients!"
        end
    when "0"
        puts "Goodbye!"
        exit
    else
        try_again
    end
    return_to_menu
end

def try_again
    puts "Sorry, that option doesn't exist. Please try again."
    menu
end

def return_to_menu
    print "Press any key to return."
    STDIN.getch
    menu
end
    
def create_patient
    puts "Please enter a patient species"
    new_species = gets.strip
    puts "Please enter a patient age"
    new_age = gets.strip
    puts "Please enter a patient name"
    new_name = gets.strip
    puts "Please enter a patient owner"
    new_owner = gets.strip
    puts "Please enter a patient phone"
    new_phone = gets.strip

    # create hash literal for each new_patient
    new_patient = {
        species: new_species,
        age: new_age,
        name: new_name,
        owner: new_owner,
        phone: new_phone
    }

    # species, age, name, owner, phone
    p1 = Patient.new(new_patient);
end

# New Patient Logic (End)

def seed
    $patients.each do |patient|
        Patient.new(patient)
    end
end