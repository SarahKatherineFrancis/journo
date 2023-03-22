class AddColumnToNotes < ActiveRecord::Migration[7.0]
  def change
    add_column :notes, :note, :text
  end
end
