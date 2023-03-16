class AddCommentToNotes < ActiveRecord::Migration[7.0]
  def change
    add_column :notes, :comment, :string
  end
end
