class Event < ApplicationRecord

	# アソシエーション
	belongs_to :user
	belongs_to :grand_prize
	has_one :notification, as: :notifiable, dependent: :destroy

	# 画像を扱う
  has_one_attached :image

  # バリデーション
	validates :image, presence: true, blob: { content_type: :image }
	

  # 画像サイズの変更
  def get_image(width,height)
    image.variant(resize_to_limit: [width,height]).processed
  end

	# 通知
  after_save do
    create_notification(user_id: self.user_id)
  end

	def self.create_event(waiting_event,grand_prize)
  	event = Event.new
  	event.user_id = waiting_event.user_id
  	event.grand_prize_id = grand_prize.id
  	event.image.attach(waiting_event.image.blob)
  	event.comment = waiting_event.comment
  	event.save
	end

end
