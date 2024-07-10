class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @grand_prizes = GrandPrize.all
  end

end
