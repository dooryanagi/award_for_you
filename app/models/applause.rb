class Applause < ApplicationRecord

	# アソシエーション
	belongs_to :user
	belongs_to :award

	# バリデーション
	# ひとつのアワードに対してユーザーからの拍手は一つだけ
	validates :user_id, uniqueness: {scope: :award_id}

end
