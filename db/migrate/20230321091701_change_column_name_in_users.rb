class ChangeColumnNameInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :bio, :nationality
    change_column :users, :nationality, :string
  end
end
