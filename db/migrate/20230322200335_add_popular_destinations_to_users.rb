class AddPopularDestinationsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :popular_destinations, :text
  end
end
