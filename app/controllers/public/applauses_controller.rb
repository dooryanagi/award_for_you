class Public::ApplausesController < ApplicationController
	before_action :authenticate_user!

	def create
		@award = Award.find(params[:award_id])
		applause = current_user.applauses.new(award_id: @award.id)
		applause.save
	end

	def destroy
		@award = Award.find(params[:award_id])
		applause = current_user.applauses.find_by(award_id: @award.id)
		applause.destroy
	end

end
		