class NotesController < ApplicationController
  def index
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.trip_id = params[:trip_id]
    redirect_to root_path if @note.save
  end

  private

  def note_params
    params.require(:note).permit(:comment)
  end
end
