class GrandPrize < ApplicationRecord
	
	# アソシエーション
	has_many :waiting_events, dependent: :destroy
	has_many :events, dependent: :destroy
	has_many :praises, dependent: :destroy
	
end
