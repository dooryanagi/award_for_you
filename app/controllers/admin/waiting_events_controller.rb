class Admin::WaitingEventsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @waiting_events = WaitingEvent.all
  end

  def destroy
		WaitingEvent.find(params[:id]).destroy
		redirect_to admin_grand_prize_path(params[:grand_prize_id])
  end

end
