class Admin::AwardsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @awards = Award.all
    case params[:sort_by]
    when 'latest'
      @awards = Award.latest.page(params[:page])
    when 'old'
      @awards = Award.old.page(params[:page])
    when 'applause_count'
      @awards = Award.applause_count.page(params[:page])
    else
      @awards = Award.page(params[:page])
    end
  end

  def destroy
    @award = Award.find(params[:id])
    @award.destroy
    redirect_to admin_awards_path
  end

end
