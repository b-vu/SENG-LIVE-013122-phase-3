class Patient < ActiveRecord::Base
    belongs_to :clinic

    has_many :appointments
    has_many :vets, through: :appointments

    # Activity 2 => Building Aggregate Class / Instance Methods

    # Class Methods

    # Return all patient names
    def self.all_patient_names
    end

    # Return all patient species
    def self.all_patient_species
    end

    # Return all patient ages
    def self.all_patient_ages
    end

    # Return oldest patient
    def self.oldest
    end

    # Return youngest patient
    def self.youngest
    end

    # Instance Methods

    # Return patient's first Vet's name
    def get_first_vet_name
    end
    
    # Return patient's vet's names
    def get_vet_names
    end

    # Return patient's appointment dates
    def get_appt_dates
    end

    # Return patient's number of vets
    def vet_count
    end

    # Return patient's number of appointments
    def appt_count
    end
end 
