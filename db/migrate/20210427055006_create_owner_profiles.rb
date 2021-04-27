class CreateOwnerProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :owner_profiles do |t|
      t.string :name
      t.string :country
      t.text :comment
      t.timestamps
    end
    remove_column :owners, :name
    remove_column :owners, :country
    remove_column :owners, :comment
  end
end
