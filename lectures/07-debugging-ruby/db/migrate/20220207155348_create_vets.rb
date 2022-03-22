class CreateVets < ActiveRecord::Migration[6.1]  
  def change
    create_table :vets do |t|
      t.string :vet_name
      t.string :speciality
    end  
  end
end
