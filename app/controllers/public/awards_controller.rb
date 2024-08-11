class Public::AwardsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :new]
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]

  def new
    @award = Award.new
  end

  def create
    @award = current_user.awards.new(award_params)
    if @award.save
      flash[:notice] = "アワードを受賞されました！おめでとうございます！"
      redirect_to award_path(@award)
    else
      flash.now[:alert] = "受賞できませんでした。必須項目を確認してください。"
      render :new
    end
  end
  
  def index
    @user = current_user
    # 本人受賞のアワード（非公開選択でも表示する）
    if params[:user_id]
      @awards = @user.awards.page(params[:page]).latest
    # 拍手したアワード一覧
    elsif params[:applauses]
      applauses = Applause.where(user_id: @user.id).pluck(:award_id)
      @awards = Award.where(id: applauses).page(params[:page]).latest
    # アワード一覧（非公開は表示しない）（並び替えに対応）
    else
      case params[:sort_by]
      when 'latest'
        @awards = Award.display.latest.page(params[:page])
      when 'old'
        @awards = Award.display.old.page(params[:page])
      when 'applause_count'
        @awards = Award.display.applause_count.page(params[:page])
      else
        @awards = Award.display.latest.page(params[:page])
      end
    end
  end

  def show
    @award = Award.find(params[:id])
    @user = @award.user
  end

  def edit
    @award = Award.find(params[:id])
  end

  def update
    @award = Award.find(params[:id])
    if @award.update(award_params)
      flash[:notice] = "アワードの編集が完了しました"
      redirect_to award_path(@award)
    else
      flash.now[:alert] = "編集できませんでした。必須項目を確認してください。"
      render :edit
    end
  end

  def destroy
    @award = Award.find(params[:id])
    if @award.destroy
      redirect_to awards_path
    else
      redirect_to award_path(@award.id)
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
