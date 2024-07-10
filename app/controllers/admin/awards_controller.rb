class Admin::AwardsController < ApplicationController

  def index
    @awards = Award.all
  end

  def show
  end

  def destroy
    @award = Award.find(params[:id])
    @award.destroy
    redirect_to admin_awards_path
  end

end
