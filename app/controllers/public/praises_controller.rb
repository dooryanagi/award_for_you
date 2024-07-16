class Public::PraisesController < ApplicationController

	def create
		grand_prize = GrandPrize.find(params[:grand_prize_id])
		praise = current_user.praises.new(praise_params)
		praise.grand_prize_id = grand_prize.id
		praise.save
		redirect_to grand_prize_path(grand_prize)
	end

	def destroy
		Praise.find(params[:id]).destroy
		redirect_to grand_prize_path(params[:grand_prize_id])
	end

	private

	def praise_params
		params.require(:praise).permit(:user_id, :grand_prise_id, :comment)
	end

end
