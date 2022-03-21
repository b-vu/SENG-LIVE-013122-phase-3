class Clinic < ActiveRecord::Base
    # What's the use value of "dependent: :destroy"? 
    has_many :patients, dependent: :destroy
end 

