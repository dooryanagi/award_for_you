class Award < ApplicationRecord

  # アソシエーション
  belongs_to :user
  has_many :applauses, dependent: :destroy

  # 画像を扱う
  has_one_attached :award_image

  # バリデーション
	validates :award_image, presence: true, blob: { content_type: :image }

  # 会員>top>新着の表示、会員＞index＞並び替え
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  # joinsだと拍手の無いものは表示されなくなってしまう
  scope :applause_count, -> {left_outer_joins(:applauses).group(:id).order('count(applauses.id) desc')}

  # 画像サイズの変更
  def get_award_image(width,height)
    award_image.variant(resize_to_limit: [width,height]).processed
  end

  # アワードにたいして拍手済みか確認
  def applaused_by?(user)
    applauses.exists?(user_id: user.id)
  end

end
