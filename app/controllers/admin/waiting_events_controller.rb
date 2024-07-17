class Admin::WaitingEventsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @waiting_events = WaitingEvent.all
  end

end
