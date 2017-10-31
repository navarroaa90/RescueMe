class RemoveTypeFromPet < ActiveRecord::Migration[5.1]
  def change
    remove_column :pets, :type, :string
  end
end
