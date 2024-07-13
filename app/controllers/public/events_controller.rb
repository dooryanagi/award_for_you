class Public::EventsController < ApplicationController

	# waiting_eventの情報をもとにデータを保存する
  def create
  	@grand_prize = GrandPrize.find(params[:grand_prize_id])
  	@waiting_event = WaitingEvent.find(params[:waiting_event_id])
    # @event = Event.new(event_params)：パラメータを受け取らないので（）は不要
  	@event = Event.new
  	@event.user_id = @waiting_event.user_id
  	@event.grand_prize_id = @grand_prize.id
    # そのままコピーは出来ないため、複製する
  	@event.image.attach(@waiting_event.image.blob)
  	@event.comment = @waiting_event.comment
  	if @event.save
  	  @waiting_event.destroy
  		redirect_back fallback_location: grand_prize_path(@grand_prize)
  	else
  		render :index
  	end
  end

	# オーナーは削除はできない

end
