class AddDateRangeToTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :date_range, :daterange
  end
end
