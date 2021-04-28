class CreateUserProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_profiles do |t|
      t.integer :user_id
      t.string :name
      t.string :gender
      t.integer :age
      t.string :email
      t.string :phone_number
      t.text :description
      t.timestamps
    end
  end
end
