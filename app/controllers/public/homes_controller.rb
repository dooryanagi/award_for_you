class Public::HomesController < ApplicationController

  def top
    @awards = Award.display.latest
    @grand_prizes = GrandPrize.latest
  end

  def about
  end

end
