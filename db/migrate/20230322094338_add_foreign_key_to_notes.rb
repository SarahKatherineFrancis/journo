class AddForeignKeyToNotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :notes, :trip, null: false, foreign_key: true
  end
end
