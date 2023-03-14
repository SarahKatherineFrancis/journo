class ChangeTypeToIntegerInActivities < ActiveRecord::Migration[7.0]
  def change
    change_column :activities, :type, 'integer USING CAST(type AS integer)'
  end
end
