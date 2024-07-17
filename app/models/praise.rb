class Praise < ApplicationRecord

	# アソシエーション
	belongs_to :user
	belongs_to :grand_prize

	# バリデーション
	validates :comment, presence: true, length: {maximum: 150 }

end
