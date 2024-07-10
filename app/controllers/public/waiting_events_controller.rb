class Public::WaitingEventsController < ApplicationController

  def new
    @waiting_event = WaitingEvent.new
  end

  def create
    @waiting_event = WaitingEvent.new(waiting_event_params)
    @waiting_event.user_id = current_user.id
    @waiting_event.grand_prize_id = params[:waiting_event][:grand_prize_id]
    if @waiting_event.save
      redirect_to congratulations_waiting_events_path
    else
      render :new
    end
  end

  def destroy
  end

  private

  def waiting_event_params
    params.require(:waiting_event).permit(:user_id, :grand_prize_id, :image, :comment)
  end

end
