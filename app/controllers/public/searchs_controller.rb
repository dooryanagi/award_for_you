class Public::SearchsController < ApplicationController

  def search
    @content = params[:content]
    @records = GrandPrize.search_for(@content)
  end

  

end
