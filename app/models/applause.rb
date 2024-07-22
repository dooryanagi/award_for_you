class Applause < ApplicationRecord

	# アソシエーション
	belongs_to :user
	belongs_to :award
	has_one :notification, as: :notifiable, dependent: :destroy

	# バリデーション
	# ひとつのアワードに対してユーザーからの拍手は一つだけ
	validates :user_id, uniqueness: {scope: :award_id}

	# 通知
  after_create do
    create_notification(user_id: award.user_id)
  end

end
