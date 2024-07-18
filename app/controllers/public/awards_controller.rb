class Public::AwardsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :new]
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
      flash[:notice] = "アワードを受賞されました！おめでとうございます！"
      redirect_to award_path(@award)
    else
      flash.now[:alert] = "受賞できませんでした。必須項目を確認してください。"
      render :new
    end
  end

  def index
    # 本人受賞のアワード（非公開選択でも表示する）
    if params[:user_id]
      @user = User.find(params[:user_id])
      @awards = @user.awards.page(params[:page])

    # 拍手したアワード一覧
    elsif params[:applauses]
      @user = current_user
      applauses = Applause.where(user_id: @user.id).pluck(:award_id)
      @awards = Award.find(applauses).page(params[:page])

    # アワード一覧（非公開は表示しない）（並び替えに対応）
    else
      if params[:sort_by] == 'latest'
        @awards = Award.where(is_public: true).latest.page(params[:page])
      elsif params[:sort_by] == 'old'
        @awards = Award.where(is_public: true).old.page(params[:page])
      elsif params[:sort_by] == 'applause_count'
        @awards = Award.where(is_public: true).applause_count.page(params[:page])
      else
        @awards = Award.where(is_public: true).page(params[:page]).per(8)
      end
    end
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
      flash[:notice] = "アワードの編集が完了しました"
      redirect_to award_path(@award)
    else
      flash.now[:alert] = "編集できませんでした。必須項目を確認してください。"
      render :edit
    end
  end

  def destroy
    @award = Award.find(params[:id])
    # destroy出来れば一覧ページへ、できなければrenderでshowのまま、は可能？
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

  # 本人を確認するメソッド
  def is_matching_login_user
    award = Award.find(params[:id])
    user_id = award.user_id
    unless user_id == current_user.id
      redirect_back fallback_location: awards_path
    end
  end


end
