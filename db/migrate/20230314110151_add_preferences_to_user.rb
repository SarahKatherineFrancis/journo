class AddPreferencesToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :eat_preferences, :string
    add_column :users, :do_preferences, :string
  end
end
