class Admin::EventsController < ApplicationController
  before_action :authenticate_admin!

  # waiting_eventの情報をもとにデータを保存する
  def create
    @waiting_event = WaitingEvent.find(params[:waiting_event_id])
    @event = Event.new(event_params)
    @event.user_id = @waiting_event.user_id
    @event.grand_prize_id = @waiting_event.grand_prize_id
    @event.image = @waiting_event.image
    @event.comment = @waiting_event.comment
    if @event.save
      @waiting_event.destroy
      redirect_to admin_waiting_events
    else
      render :index
    end
  end

  def index
  end

  def show
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :grand_prize_id, :image, :comment)
  end


end
