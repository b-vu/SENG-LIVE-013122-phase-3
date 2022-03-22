class Appointment < ActiveRecord::Base
    belongs_to :patient
    belongs_to :vet

    # Activity 1 => Building Aggregate Class / Instance Methods

    # Class Methods

    # Return earliest appointment
    def self.earliest
    end

    # Return latest appointment
    def self.latest
    end
    
    # Instance Methods
    
    # Return appointment patient's name
    def get_patient_name
    end

    # Return appointment vet's name
    def get_vet_name
    end
end 

