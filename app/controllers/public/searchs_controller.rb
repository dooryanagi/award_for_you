class Public::SearchsController < ApplicationController

  def search
    @content = params[:content]
    @all_records = GrandPrize.search_for(@content)
    @records = @all_records.page(params[:page]).per(6)
  end

  def search_by_keyword
    @keyword = params[:keyword]
    @all_records = GrandPrize.search_by_keyword_for(@keyword)
    @records = @all_records.page(params[:page]).per(6)
  end

  def keyword_index
    @grand_prizes = GrandPrize.all
  end

end
