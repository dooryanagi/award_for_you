class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    case params[:sort_by]
    when 'latest'
      @grand_prizes = GrandPrize.page(params[:page]).latest
    when 'old'
      @grand_prizes = GrandPrize.page(params[:page]).old
    when 'event_count'
      @grand_prizes = GrandPrize.page(params[:page]).event_count
    when 'praise_count'
      @grand_prizes = GrandPrize.page(params[:page]).praise_count
    else
      @grand_prizes = GrandPrize.page(params[:page]).waiting_event_count
    end
    @users = User.all
  end

end
