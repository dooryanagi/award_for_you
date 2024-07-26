class Public::HomesController < ApplicationController

  def top
    @awards = Award.where(is_public: true).latest
    @grand_prizes = GrandPrize.latest
  end

  def about
  end

end
