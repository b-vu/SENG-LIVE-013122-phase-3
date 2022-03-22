class Clinic < ActiveRecord::Base
    has_many :patients, dependent: :destroy

    # Activity 1 => Building Aggregate Class / Instance Methods

    # Class Methods

    # Return all clinic names
    def self.all_clinic_names
    end

    # Return total number of clinics
    def self.clinic_count
    end

    # Return clinic with least number of patients
    def self.least_patients
    end

    # Instance Methods

    # Return clinic's total number of patients
    def patient_count
    end

    # Return clinic's patient names
    def patient_names
    end
end 

