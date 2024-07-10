class Admin::WaitingEventsController < ApplicationController

  def index
    @waiting_events = WaitingEvent.all
  end

end
