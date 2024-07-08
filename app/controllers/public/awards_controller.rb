class Public::AwardsController < ApplicationController
  # 本人以外は編集、更新、削除ができない
  # 削除はここに定義せずともできない（ページがないため）
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]

  def new
    @award = Award.new
  end

  def create
    @award = Award.new(award_params)
    # form_withで送られてこないデータについて指定
    @award.user_id = current_user.id
    # save出来れば詳細ページへ、できなければrenderでnewのまま
    if @award.save
      redirect_to award_path(@award)
    else
      render :new
    end
  end

  def index
    # 写真がある場合とない場合表示を上部と下部で分ける
    # whereでそれぞれの場合毎の変数を定義
    # ビューで分岐をする方がシンプル
    # @awards_with_images = Award.joins(:award_image_attachment).distinct
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
    # update出来れば詳細ページへ、できなければrenderでeditのまま
    if @award.update(award_params)
      redirect_to award_path(@award)
    else
      render :edit
    end
  end

  def destroy
    @award = Award.find(params[:id])
    # destroy出来れば一覧ページへ、できなければrenderでshowのまま、は可能？
    if @award.destroy
      redirect_to awards_path
    else
      redirect_to awards_path
    end
  end

  private

  def award_params
    params.require(:award).permit(:user_id, :comment, :is_public, :award_image)
  end

  def is_matching_login_user
    award = Award.find(params[:id])
    user_id = award.user_id
    unless user_id == current_user.id
      redirect_back fallback_location: awards_path
    end
  end


end
