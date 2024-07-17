class Admin::GrandPrizesController < ApplicationController
  before_action :authenticate_admin!

  def new
    @grand_prize = GrandPrize.new
  end

  def create
    @admin = current_admin
    @grand_prize = GrandPrize.new(grand_prize_params)
    @grand_prize.owner_id = @admin.id
    if @grand_prize.save
      redirect_to admin_path
    else
      render :new
    end
  end

  def show
    @grand_prize = GrandPrize.find(params[:id])
    # @events = @grand_prize.events.all
    # @waiting_events = @grand_prize.waiting_events.all
  end

  def edit
    @grand_prize = GrandPrize.find(params[:id])
  end

  def update
    @grand_prize = GrandPrize.find(params[:id])
    if @grand_prize.update(grand_prize_params)
      redirect_to admin_grand_prize_path(@grand_prize)
    else
      render :edit
    end
  end

  def destroy
    @grand_prize = GrandPrize.find(params[:id])
    # destroy出来れば一覧ページへ、できなければrenderでshowのまま、は可能？
    if @grand_prize.destroy
      redirect_to grand_prizes_path
    else
      render :show
    end
  end

  # 大賞へのノミネートを承認する（1件）
  def permit
  end

  # 大賞へのノミネートを承認する（全件）
  def permit_all
  end


  private

  def grand_prize_params
    params.require(:grand_prize).permit(:name, :introduction, :owner_id, :keyword_1, :keyword_2, :keyword_3, :grand_prize_image)
  end

end