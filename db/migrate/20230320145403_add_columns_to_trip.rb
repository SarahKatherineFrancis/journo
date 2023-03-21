class AddColumnsToTrip < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :budget, :string
    add_column :trips, :packing_list, :text
  end
end
