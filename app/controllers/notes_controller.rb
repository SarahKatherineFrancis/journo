class NotesController < ApplicationController
  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.activity_id = params[:activity_id]
    redirect_to user_path if @note.save
  end

  private

  def note_params
    params.require(:note).permit(:comment)
  end
end
