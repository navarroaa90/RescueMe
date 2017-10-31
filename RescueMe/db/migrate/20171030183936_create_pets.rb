class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :pet_name
      t.string :type
      t.string :breed
      t.string :gender
      t.integer :age
      t.integer :weight
      t.string :personality
      t.string :info
      t.attachment :image
      

      t.timestamps
    end
  end
end
