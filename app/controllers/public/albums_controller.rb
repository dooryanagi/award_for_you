class Public::AlbumsController < ApplicationController

  def new
    @album = Album.new
  end

  def make_album
    @child = Child.find(params[:child_id])
    start_date = params[start_date]
    end_date = params[end_date]
    @events = Event.includes(:grand_prize).where(grand_prize: {keyword_1: 'first_time'}).where(character: @child.name).where(date: start_date...end_date).old
  end

end
