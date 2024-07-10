class WaitingEvent < ApplicationRecord

	# アソシエーション
	belongs_to :user
	belongs_to :grand_prize

	# 画像を扱う
  has_one_attached :image

end
