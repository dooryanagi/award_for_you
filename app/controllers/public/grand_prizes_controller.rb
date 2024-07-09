class Public::GrandPrizesController < ApplicationController

  def new
    @grand_prize = GrandPrize.new
  end

  def create
    @grand_prize = GrandPrize.new(grand_prize_params)
    @grand_prize.owner_id = current_user.id
    if @grand_prize.save
      redirect_to grand_prizes_path
    else
      render :new
    end
  end

  def index
    @grand_prizes = GrandPrize.all
  end

  def show
    @grand_prize = GrandPrize.find(params[:id])
  end

  def edit
  end

  private

  def grand_prize_params
    params.require(:grand_prize).permit(:name, :introduction, :owner_id, :keyword_1, :keyword_2, :keyword_3, :grand_prize_image)
  end

end
