class Admin::EventsController < ApplicationController
  before_action :authenticate_admin!
  
  include EventsConcern

  def create
	  create(admin_grand_prize_path(@grand_prize))
  end
  
  def create_all
	  create_all(admin_grand_prize_path(@grand_prize))
  end

  def destroy
		Event.find(params[:id]).destroy
		redirect_to admin_grand_prize_path(params[:grand_prize_id])
  end

end
