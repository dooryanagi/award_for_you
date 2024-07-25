class Public::SearchsController < ApplicationController

  def search
    @content = params[:content]
    @all_records = GrandPrize.search_for(@content)
    @records = @all_records.page(params[:page]).per(6)
  end

  def search_by_keyword
    @keyword_1 = params[:keyword_1]
    @keyword = params[:keyword]
    @all_records = GrandPrize.search_by_keyword_for(@keyword_1, @keyword)
    @records = @all_records.page(params[:page]).per(6)
  end

  def keyword_index
    @daily_grand_prizes = GrandPrize.where(keyword_1: 0)
    @first_time_grand_prizes = GrandPrize.where(keyword_1: 1)
  end

end
