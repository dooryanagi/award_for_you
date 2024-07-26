class Public::EventsController < ApplicationController

  include EventsConcern

  def show
    @grand_prize = GrandPrize.find(params[:grand_prize_id])
    @event = @grand_prize.events.find(params[:id])
  end

  def create
	  create(grand_prize_path(@grand_prize))
  end

  def create_all
	  create_all(grand_prize_path(@grand_prize))
  end

end
