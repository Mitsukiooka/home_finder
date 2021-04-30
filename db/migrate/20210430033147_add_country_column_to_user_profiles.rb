class AddCountryColumnToUserProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :user_profiles, :country, :string
  end
end
