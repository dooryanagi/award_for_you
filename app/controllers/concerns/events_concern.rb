module EventsConcern
  extend ActiveSupport::Concern

	def create(redirect_path)
		@grand_prize = GrandPrize.find(params[:grand_prize_id])
	  @waiting_event = WaitingEvent.find(params[:waiting_event_id])
	  create_event(@event, @waiting_event)
	  if @event.save
		  @waiting_event.destroy
	  	flash[:notice] = "大賞を授与しました。ご協力ありがとうございます！"
	  	redirect_back fallback_location: redirect_path
	  else
	  	render :index
	  end
	end

	def create_all(redirect_path)
  	@grand_prize = GrandPrize.find(params[:grand_prize_id])
  	@waiting_events = WaitingEvent.where(grand_prize_id: @grand_prize.id)
  	@waiting_events.each do |waiting_event|
	  	create_event(@event, waiting_event)
	  	@event.save
	  end
	  @waiting_events.destroy_all
  	flash[:notice] = "全員に大賞を授与しました。ご協力ありがとうございます"
  	redirect_back fallback_location: redirect_path
	end

	def create_event(event, waiting_event)
		event = Event.new
		event.user_id = waiting_event.user_id
		event.grand_prize_id = @grand_prize.id
		event.image.attach(waiting_event.image.blob)
		event.comment = waiting_event.comment
	end

end