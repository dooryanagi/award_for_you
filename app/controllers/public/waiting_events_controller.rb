class Public::WaitingEventsController < ApplicationController
  before_action :authenticate_user!, except: [:new]

  def new
    @waiting_event = WaitingEvent.new
    @grand_prize = GrandPrize.find(params[:grand_prize_id])
  end

  def create
    @waiting_event = WaitingEvent.new(waiting_event_params)
    @waiting_event.user_id = current_user.id
    @waiting_event.grand_prize_id = params[:waiting_event][:grand_prize_id]

    if params[:waiting_event][:select_member] == "children"
      @child = Child.find(params[:waiting_event][:child_id])
      @waiting_event.child_id = @child.id
    end

    if @waiting_event.save
      redirect_to congratulations_grand_prize_waiting_events_path
    else
      @grand_prize = GrandPrize.find(params[:waiting_event][:grand_prize_id])
      flash.now[:alert] = "大賞へノミネートできませんでした。必須項目を確認してください。"
      render :new
    end
  end

  def destroy
		WaitingEvent.find(params[:id]).destroy
		flash[:notice] = "大賞を辞退しました"
		redirect_to my_page_path(params[:grand_prize_id])
  end

  def congratulations
  end

  private

  def waiting_event_params
    params.require(:waiting_event).permit(:user_id, :grand_prize_id, :image, :comment, :child_id)
  end

end
