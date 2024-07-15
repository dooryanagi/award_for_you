class Admin::AwardsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @awards = Award.all

    if params[:sort_by] == 'latest'
      @awards = Award..latest
    elsif params[:sort_by] == 'old'
      @awards = Award.old
    elsif params[:sort_by] == 'applause_count'
      @awards = Award.applause_count
    else
      @awards = Award.all
    end
  end

  def show
  end

  def destroy
    @award = Award.find(params[:id])
    @award.destroy
    redirect_to admin_awards_path
  end

end
