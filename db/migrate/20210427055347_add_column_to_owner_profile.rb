class AddColumnToOwnerProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :owner_profiles, :owner_id, :integer
  end
end
