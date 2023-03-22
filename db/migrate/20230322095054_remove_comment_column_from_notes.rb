class RemoveCommentColumnFromNotes < ActiveRecord::Migration[7.0]
  def change
    remove_column :notes, :comment, :string
  end
end
