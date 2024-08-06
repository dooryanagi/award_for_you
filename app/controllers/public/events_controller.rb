class Public::EventsController < ApplicationController

  include EventsConcern

  def show
    @grand_prize = GrandPrize.find(params[:grand_prize_id])
    @event = @grand_prize.events.find(params[:id])
    @user = @event.user
  end

  def create
  	@grand_prize = GrandPrize.find(params[:grand_prize_id])
  	@waiting_event = WaitingEvent.find(params[:waiting_event_id])
  	@event = Event.create_event(@waiting_event, @grand_prize)
  	if @event
  	  @waiting_event.destroy
  	  redirect_notice(@grand_prize, "大賞を授与しました。ご協力ありがとうございます！")
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
    redirect_notice(@grand_prize, "全てに大賞を授与しました。ご協力ありがとうございます！")
  end

  def edit
    @grand_prize = GrandPrize.find(params[:grand_prize_id])
    @event = @event = @grand_prize.events.find(params[:id])
  end

  def update
    @grand_prize = GrandPrize.find(params[:grand_prize_id])
    @event = @event = @grand_prize.events.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "編集が完了しました"
      redirect_to grand_prize_event_path(@grand_prize, @event)
    else
      flash.now[:alert] = "編集できませんでした。必須項目を確認してください。"
      render :edit
    end
  end



  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:child_id, :date)
  end

end
