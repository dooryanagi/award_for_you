class Admin::AwardsController < ApplicationController
  before_action :authenticate_admin!

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
