class Award < ApplicationRecord

  # アソシエーション
  belongs_to :user
  has_many :applauses, dependent: :destroy

  # 画像を扱う
  has_one_attached :award_image

  # バリデーション
	validates :award_image, presence: true, blob: { content_type: :image }
  validates :comment, presence: true, length: { maximum: 150 }

  # scope
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :applause_count, -> {left_outer_joins(:applauses).group(:id).order('count(applauses.id) desc')}
  scope :display, -> {where(is_public: true)}

  # 画像サイズの変更
  def get_award_image(width,height)
    award_image.variant(resize_to_limit: [width,height]).processed
  end

  # アワードにたいして拍手済みか確認
  def applaused_by?(user)
    applauses.exists?(user_id: user.id)
  end

end
