class Public::ApplausesController < ApplicationController

	def create
		award = Award.find(params[:award_id])
		applause = current_user.applauses.new(award_id: award.id)
		applause.save
		# 一覧ページと詳細ページで分ける？？
		redirect_to awards_path
	end

	def destroy
		award = Award.find(params[:award_id])
		applause = current_user.applauses.find_by(award_id: award.id)
		applause.destroy
		redirect_to awards_path
	end

end
