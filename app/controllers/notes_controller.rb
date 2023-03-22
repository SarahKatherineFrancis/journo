class NotesController < ApplicationController
  # def new
  #   @note = Note.new
  # end

  # def create
  #   @note = Note.new(note_params)
  #   @note.user = current_user
  #   @trip = Trip.find(params[:trip_id])
  #   @note.trip = @trip
  #   redirect_to trip_path(@trip) if @note.save
  # end

  def edit
    @note = Note.find(params[:id])
    @trip = Trip.find(params[:trip_id])
    @note.trip = @trip
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    @trip = Trip.find(params[:trip_id])
    redirect_to trip_path(@trip) if @note.save
  end

  private

  def note_params
    params.require(:note).permit(:note)
  end
end
