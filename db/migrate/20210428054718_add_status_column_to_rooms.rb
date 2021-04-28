class AddStatusColumnToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :status, :string
    add_column :rooms, :country, :string
  end
end
