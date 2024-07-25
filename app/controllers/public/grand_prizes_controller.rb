class Public::GrandPrizesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :is_matching_owner, only: [:edit, :update, :destroy]

  def new
    @grand_prize = GrandPrize.new
  end

  def create
    @grand_prize = GrandPrize.new(grand_prize_params)
    @grand_prize.owner_id = current_user.id
    if @grand_prize.save
      flash[:notice] = "大賞が無事設立されました。ありがとうございます！！"
      redirect_to grand_prizes_path
    else
      flash.now[:alert] = "大賞が設立できませんでした。必須項目を確認してください。"
      render :new
    end
  end

  def index
    @user = current_user
    # 本人が受賞した大賞
    if params[:event]
      events = Event.where(user_id: @user.id).pluck(:grand_prize_id)
      @grand_prizes = GrandPrize.where(id: events).page(params[:page]).per(6)
    # 本人が設立した大賞
    elsif params[:grand_prize]
      @grand_prizes = GrandPrize.where(owner_id: @user.id).page(params[:page]).per(6)
    # 大賞一覧（並び替えに対応）
    else
      case params[:sort_by]
      when 'latest'
        @grand_prizes = GrandPrize.page(params[:page]).latest.per(6)
      when 'old'
        @grand_prizes = GrandPrize.page(params[:page]).old.per(6)
      when 'event_count'
        @grand_prizes = GrandPrize.page(params[:page]).event_count.per(6)
      when 'praise_count'
        @grand_prizes = GrandPrize.page(params[:page]).praise_count.per(6)
      else
        @grand_prizes = GrandPrize.page(params[:page]).latest.per(6)
      end
    end
  end

  def show
    @grand_prize = GrandPrize.find(params[:id])
    @praise = Praise.new
  end

  def edit
    @grand_prize = GrandPrize.find(params[:id])
  end

  def update
    @grand_prize = GrandPrize.find(params[:id])
    if @grand_prize.update(grand_prize_params)
      flash[:notice] = "大賞が編集できました。"
      redirect_to grand_prize_path(@grand_prize)
    else
      flash.now[:alert] = "大賞が編集できませんでした。必須項目を確認してください。"
      render :edit
    end
  end

  def destroy
    @grand_prize = GrandPrize.find(params[:id])
    if @grand_prize.destroy
      redirect_to grand_prizes_path
    else
      render :show
    end
  end

  private

  def grand_prize_params
    params.require(:grand_prize).permit(:name, :introduction, :owner_id, :keyword_1, :keyword_2, :keyword_3, :grand_prize_image)
  end

  # ログインユーザがオーナーかを確認するメソッド
  def is_matching_owner
    grand_prize = GrandPrize.find(params[:id])
    owner_id = grand_prize.owner_id
    unless owner_id == current_user.id
      redirect_back fallback_location: grand_prizes_path
    end
  end

end
