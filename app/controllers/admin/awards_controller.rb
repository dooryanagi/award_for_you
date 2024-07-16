class Admin::AwardsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @awards = Award.all

    if params[:sort_by] == 'latest'
      @awards = Award.page(params[:page]).latest
    elsif params[:sort_by] == 'old'
      @awards = Award.page(params[:page]).old
    elsif params[:sort_by] == 'applause_count'
      @awards = Award.page(params[:page]).applause_count
    else
      @awards = Award.page(params[:page])
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
