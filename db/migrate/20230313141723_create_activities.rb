class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :description
      t.string :type
      t.string :status
      t.references :trips, null: false, foreign_key: true

      t.timestamps
    end
  end
end
