class Applause < ApplicationRecord
	
	# アソシエーション
	belongs_to :user
	belongs_to :award
	
end
