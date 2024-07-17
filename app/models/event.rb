class Event < ApplicationRecord

	# アソシエーション
	belongs_to :user
	belongs_to :grand_prize

	# 画像を扱う
  has_one_attached :image

  # バリデーション
	validates :image, presence: true, blob: { content_type: :image }

  # 画像サイズの変更
  def get_image(width,height)
    image.variant(resize_to_limit: [width,height]).processed
  end

end
