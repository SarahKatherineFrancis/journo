class RemoveForeignKeyFromNotes < ActiveRecord::Migration[7.0]
  def change
    remove_reference :notes, :activity, activities: true, null: false, foreign_key: true
  end
end
