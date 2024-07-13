class Public::SearchsController < ApplicationController

  # 大賞タイトル検索
  def search
    @content = params[:content]
    @records = GrandPrize.search_for(@content)
  end

  # キーワード検索
  def search_keyword
  end

end
