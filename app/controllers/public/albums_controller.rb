class Public::AlbumsController < ApplicationController

  def new
    @album = Album.new
  end

  def make_album
    @child = Child.find(params[:child_id])
    start_date = Date.new(params["start_date(1i)"].to_i, params["start_date(2i)"].to_i, params["start_date(3i)"].to_i)
    end_date = Date.new(params["end_date(1i)"].to_i, params["end_date(2i)"].to_i, params["end_date(3i)"].to_i)
    p start_date
    p end_date
    @events = Event.includes(:grand_prize, :child).where(grand_prize: {keyword_1: 'first_time'}).where(child_id: @child.id).where(created_at: start_date...end_date)
    p "============================"
    p @events
  end

  private

  def album_params
    params.require(:album).permit(:child_id)
  end

end
