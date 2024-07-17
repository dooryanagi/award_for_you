class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    if params[:sort_by] == 'latest'
      @grand_prizes = GrandPrize.page(params[:page]).latest
    elsif params[:sort_by] == 'old'
      @grand_prizes = GrandPrize.page(params[:page]).old
    elsif params[:sort_by] == 'event_count'
      @grand_prizes = GrandPrize.page(params[:page]).event_count
    elsif params[:sort_by] == 'praise_count'
      @grand_prizes = GrandPrize.page(params[:page]).praise_count
    else
      @grand_prizes = GrandPrize.page(params[:page]).waiting_event_count
    end
  end

end
