# Activity #2 => Using Seed Data

# Create two Clinics and five Patients, making sure to associate
# each Patient with one Clinic via the "clinic_id" foreign key.

c1 = Clinic.create(clinic_name: "First Clinic", address: "123 Abc Rd", phone: "123-456-7890")
c2 = Clinic.create(clinic_name: "Second Clinic", address: "456 Def Ln", phone: "098-765-4321")
c3 = Clinic.create(clinic_name: "Third Clinic", address: "789 Ghi Ct", phone: "456-789-0123")

Patient.create(species: "Dog", name: "Clifford", age: 4, owner: "Brian", phone: "111-111-1111", active: true, clinic_id: c2.id)
Patient.create(species: "Mouse", name: "Mickey", age: 7, owner: "Andrew", phone: "222-222-2222", active: false, clinic_id: c2.id)
Patient.create(species: "Cat", name: "Garfield", age: 2, owner: "Luis", phone: "333-333-3333", active: true, clinic_id: c1.id)
Patient.create(species: "Cricket", name: "Jimmy", age: 3, owner: "Jill", phone: "444-444-4444", active: false, clinic_id: c2.id)
Patient.create(species: "Elephant", name: "Dumbo", age: 9, owner: "Irene", phone: "555-555-5555", active: false, clinic_id: c1.id)

# Run 'rake db:seed' to add this information to your DB, making sure
# to verify that the DB has been populated with the appropriate resources.

# BONUS => What Rake command would we run to ensure that our DB doesn't
# contain duplicate data? Add another Clinic and re-seed your DB before confirming 
# that there are no duplicates (i.e., 3 Clinics instead of 5).

# Confirmation Message
puts 'Seeding complete!'