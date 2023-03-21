class RemoveDateRangeFromTrips < ActiveRecord::Migration[7.0]
  def change
    remove_column :trips, :date_range, :daterange
  end
end
