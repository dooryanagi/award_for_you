class Public::PraisesController < ApplicationController
  before_action :authenticate_user!

	def create
		@grand_prize = GrandPrize.find(params[:grand_prize_id])
		@praise = current_user.praises.new(praise_params)
		@praise.grand_prize_id = @grand_prize.id
		@praise.save
	end

	def destroy
		Praise.find(params[:id]).destroy
	end

	private

	def praise_params
		params.require(:praise).permit(:user_id, :grand_prise_id, :comment)
	end

end