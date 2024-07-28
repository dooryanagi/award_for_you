class Admin::EventsController < ApplicationController
  before_action :authenticate_admin!

  include EventsConcern

  def create
  	@grand_prize = GrandPrize.find(params[:grand_prize_id])
  	@waiting_event = WaitingEvent.find(params[:waiting_event_id])
  	@event = Event.create_event(@waiting_event, @grand_prize)
  	if @event
  	  @waiting_event.destroy
  	  redirect_notice(@grand_prize, "大賞を授与しました。")
  	else
  		render :show
  	end
  end

  def create_all
    @grand_prize = GrandPrize.find(params[:grand_prize_id])
  	@waiting_events = WaitingEvent.where(grand_prize_id: @grand_prize.id)
  	@error = false
  	@waiting_events.each do |waiting_event|
      @event = Event.create_event(waiting_event, @grand_prize)
      @error |= !@event
    end
    @waiting_events.destroy_all
    if @error
      flash[:alert] = "エラーが発生しました。"
    end
    redirect_notice(@grand_prize, "全てに大賞を授与しました。")
  end

  def destroy
		Event.find(params[:id]).destroy
		redirect_to admin_grand_prize_path(params[:grand_prize_id])
  end

end
