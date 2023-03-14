class RemovePreferencesFromTrips < ActiveRecord::Migration[7.0]
  def change
    remove_column :trips, :food_preferences, :integer
    remove_column :trips, :activeness, :integer
  end
end
