class RemovePreferencesFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :eat_preferences, :string
    remove_column :users, :do_preferences, :string
  end
end
