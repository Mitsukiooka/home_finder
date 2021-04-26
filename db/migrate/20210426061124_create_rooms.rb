class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string "name"
      t.string "address"
      t.integer "rent"
      t.string "nearest_station"
      t.text "comment"
      t.timestamps
    end
  end
end
