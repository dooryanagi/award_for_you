class Public::SearchsController < ApplicationController

  # 大賞タイトル検索
  def search
    @content = params[:content]
    @records = GrandPrize.search_for(@content)
  end

  # キーワード検索
  def search_by_keyword
    @keyword_1 = params[:keyword_1]
    @keyword = params[:keyword]
    @records = GrandPrize.search_by_keyword_for(@keyword_1, @keyword)
  end

end
