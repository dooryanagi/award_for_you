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

  end

  def show
  end

  def edit
  end

  private

  def award_params
    params.require(:award).permit(:user_id, :comment, :is_public, :award_image)
  end

end
