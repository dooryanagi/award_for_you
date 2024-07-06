class Award < ApplicationRecord

  # アソシエーション
  belongs_to :user
  has_many :applauses, dependent: :destroy

  # 画像を扱う
  has_one_attached :award_image

  # バリデーション
  # コメントか画像かどちらかを必須とする
  validates :award_image, presence: true, unless: :comment
  validates :comment, presence: true, length: {maximum: 200}, unless: :award_image

  # 画像サイズの変更
  def get_award_image(width,height)
    award_image.variant(resize_to_limit: [width,height]).processed
  end

end
