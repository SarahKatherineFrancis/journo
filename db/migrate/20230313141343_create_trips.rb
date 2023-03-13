class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.string :trip_name
      t.string :destination
      t.date :start_date
      t.date :end_date
      t.integer :food_preferences
      t.integer :activeness
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
