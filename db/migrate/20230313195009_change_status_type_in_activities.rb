class ChangeStatusTypeInActivities < ActiveRecord::Migration[7.0]
  def change
    change_column :activities, :status, :integer
  end
end
