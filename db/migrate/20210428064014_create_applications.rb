class CreateApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.integer :user_id
      t.integer :room_id
      t.string :user_name
      t.string :user_email
      t.string :user_phone_number
      t.string :status
      t.text :comment
      t.timestamps
    end
  end
end
