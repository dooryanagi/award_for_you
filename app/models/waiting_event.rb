class WaitingEvent < ApplicationRecord

	# アソシエーション
	belongs_to :user
	belongs_to :grand_prize

end
