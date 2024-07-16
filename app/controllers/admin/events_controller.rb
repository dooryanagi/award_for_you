class Admin::EventsController < ApplicationController
  before_action :authenticate_admin!

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
  		redirect_back fallback_location: admin_grand_prize_path(@grand_prize)
  	else
  		render :index
  	end
  end

  # DRYに則りリファクタリングすべき
  def create_all
  	@grand_prize = GrandPrize.find(params[:grand_prize_id])
  	@waiting_events = WaitingEvent.where(grand_prize_id: @grand_prize.id)
  	@waiting_events.each do |waiting_event|
  	  @event = Event.new
  	  @event.user_id = waiting_event.user_id
  	  @event.grand_prize_id = @grand_prize.id
  	  @event.image.attach(waiting_event.image.blob)
  	  @event.comment = waiting_event.comment
  	  @event.save
  	end
  	@waiting_events.destroy_all
  	redirect_back fallback_location: admin_grand_prize_path(@grand_prize)
  end

  def permit_all
  end

  def index
  end

  def show
  end

  def destroy
  end

  private

  # 受け取るパラメータに対して許可をしている
  # すでに保存しているところから持ってくるから不要
  def event_params
    params.require(:event).permit(:user_id, :grand_prize_id, :image, :comment)
  end


end
