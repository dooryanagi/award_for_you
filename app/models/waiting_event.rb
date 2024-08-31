class WaitingEvent < ApplicationRecord

	# アソシエーション
	belongs_to :user
	belongs_to :grand_prize
	has_one :notification, as: :notifiable, dependent: :destroy

	# 画像を扱う
  has_one_attached :image

  # バリデーション
	validates :image, presence: true, blob: { content_type: :image }
	validates :comment, presence: true, length: { maximum: 150 }

  # 画像サイズの変更
  def get_image(width,height)
    image.variant(resize_to_limit: [width,height]).processed
  end

	# 通知
  after_create do
  	grand_prize = self.grand_prize
    create_notification(user_id: grand_prize.owner_id)
  end

end
