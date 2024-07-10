class Admin::HomesController < ApplicationController
  
  def top
    @grand_prizes = GrandPrize.all
  end
  
end
