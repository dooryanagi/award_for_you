class Award < ApplicationRecord

  # アソシエーション
  belongs_to :user
  has_many :applauses, dependent: :destroy

  # 画像を扱う
  has_one_attached :award_image

  # バリデーション
	validates :award_image, presence: true, blob: { content_type: :image }
  
  # 会員>top>新着の表示
  scope :latest, -> {order(created_at: :desc)}

  # 画像サイズの変更
  def get_award_image(width,height)
    award_image.variant(resize_to_limit: [width,height]).processed
  end

  # アワードにたいして拍手済みか確認
  def applaused_by?(user)
    applauses.exists?(user_id: user.id)
  end

end
