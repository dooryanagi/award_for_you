class Public::GrandPrizesController < ApplicationController
  # ログインしていない場合は一覧と詳細の閲覧以外は出来ない
  before_action :authenticate_user!, except: [:index, :show]
  # 大賞のオーナーでなければ編集、更新、削除は出来ない
  before_action :is_matching_owner, only: [:edit, :update, :destroy]

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
    # 本人が受賞した大賞
    if params[:event]
      @user = current_user
      events = Event.where(user_id: @user.id).pluck(:grand_prize_id)
      @grand_prizes = Kaminari.paginate_array(GrandPrize.find(events)).page(params[:page])
    # 本人が設立した大賞
    elsif params[:grand_prize]
      @user = current_user
      @grand_prizes = GrandPrize.where(owner_id: @user.id).page(params[:page])
    else
      # 大賞一覧（並び替えに対応）
      if params[:sort_by] == 'latest'
        @grand_prizes = GrandPrize.page(params[:page]).latest
      elsif params[:sort_by] == 'old'
        @grand_prizes = GrandPrize.page(params[:page]).old
      elsif params[:sort_by] == 'event_count'
        @grand_prizes = GrandPrize.page(params[:page]).event_count
      elsif params[:sort_by] == 'praise_count'
        @grand_prizes = GrandPrize.page(params[:page]).praise_count
      else
        @grand_prizes = GrandPrize.page(params[:page])
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
      redirect_to grand_prize_path(@grand_prize)
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
