class GrandPrize < ApplicationRecord

	# アソシエーション
	has_many :waiting_events, dependent: :destroy
	has_many :events, 				dependent: :destroy
	has_many :praises,				dependent: :destroy
	has_many :users,															through: :events

  # 画像を扱う
  has_one_attached :grand_prize_image

	# バリデーション
	validates :grand_prize_image, presence: true, blob: { content_type: :image }
	validates :name, presence: true, length: { maximum: 10 }, uniqueness: true
	validates :introduction, presence: true, length: {maximum: 200 }
	validates :keyword_1, presence: true

	# enum
	enum keyword_1: { daily: 0, first_time: 1}

  # 会員>top>新着の表示、会員＞index＞並び替え
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :event_count, -> {left_outer_joins(:events).group(:id).order('count(events.id) desc')}
  scope :waiting_event_count, -> {left_outer_joins(:waiting_events).group(:id).order('count(waiting_events.id) desc')}
  scope :praise_count, -> {left_outer_joins(:praises).group(:id).order('count(praises.id) desc')}

  # 画像サイズの変更
  def get_grand_prize_image(width,height)
		if grand_prize_image.present?
			grand_prize_image.variant(resize_to_limit: [width,height]).processed
		end
  end

	# 検索機能
  def self.search_for(content)
     GrandPrize.where('name LIKE ?', '%' + content + '%')
  end
	def self.search_by_keyword_for(keyword)
		if keyword == "デイリー"
			keyword = "daily"
		elsif keyword == "はじめて"
			keyword = "first_time"
		end
	  GrandPrize.where(keyword_1: GrandPrize.keyword_1s[keyword]).or(GrandPrize.where('keyword_2 LIKE ?','%' + keyword + '%')).or(GrandPrize.where('keyword_3 LIKE ?','%' + keyword + '%'))
	end

end
