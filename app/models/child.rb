class Child < ApplicationRecord

	# アソシエーション
  belongs_to :user
  has_many :waiting_events
  has_many :events

	# 画像を扱う
  has_one_attached :prof_image

	# バリデーション
  validates :name, presence: true, length: {in: 2..10}
  validates :birthday, presence: true

  def get_prof_image(width,height)
    prof_image.variant(resize_to_limit: [width,height]).processed
  end

  def age(birthday)
	  now = Time.now.utc.to_date
	  years = now.year - birthday.year
	  months = now.month - birthday.month
	  if now.day < birthday.day
	    months -= 1
    	if months < 0
      	years -= 1
      	months += 12
    	end
  	end
  	if years == 0
    	"#{months}ヶ月"
	  else
    	"#{years}歳#{months}ヶ月"
	  end
	end

end
