class Admin::PraisesController < ApplicationController
  before_action :authenticate_admin!

	def destroy
		Praise.find(params[:id]).destroy
		redirect_to admin_grand_prize_path(params[:grand_prize_id])
	end

end
