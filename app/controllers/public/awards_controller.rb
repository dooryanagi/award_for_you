class Public::AwardsController < ApplicationController
  def new
    @award = Award.new
  end

  def create
    @award = Award.new(award_params)
    # form_withで送られてこないデータについて指定
    @award.user_id = current_user.id
    @award.save
    redirect_to award_path(@award)
  end

  def index
    @awards = Award.all
  end

  def show
    @award = Award.find(params[:id])
  end

  def edit
    @award = Award.find(params[:id])
  end

  def update
    @award = Award.find(params[:id])
    @award.update(award_params)
    redirect_to award_path(@award)
  end

  def destroy
    @award = Award.find(params[:id])
    @award.destroy
    redirect_to awards_path
  end

  private

  def award_params
    params.require(:award).permit(:user_id, :comment, :is_public, :award_image)
  end

end
