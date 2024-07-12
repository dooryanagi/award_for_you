class GrandPrize < ApplicationRecord

	# アソシエーション
	has_many :waiting_events, dependent: :destroy
	has_many :events, dependent: :destroy
	has_many :praises, dependent: :destroy

  # 画像を扱う
  has_one_attached :grand_prize_image

	# バリデーション
	validates :name, presence: true, length: { minimum: 2, maximum: 50 }, uniqueness: true
	validates :introduction, presence: true, length: {maximum: 200 }
	validates :keyword_1, presence: true

	# enum
	enum keyword_1: { daily: 0, first_time: 1}

  # 会員>top>新着の表示
  scope :latest, -> {order(created_at: :desc)}

  # 画像サイズの変更
  def get_grand_prize_image(width,height)
    grand_prize_image.variant(resize_to_limit: [width,height]).processed
  end

	# 検索機能
  def self.search_for(content)
     GrandPrize.where('name LIKE ?', '%' + content + '%')
  end

end
