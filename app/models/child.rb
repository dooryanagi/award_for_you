class Child < ApplicationRecord

  # アソシエーション
  belongs_to :user

  # バリデーション
  validates :name, presence: true, length: {in: 2..20}
  validates :birthday, presence: true

	def age(birthday)
	  now = Date.today
	  years = now.year - birthday.year
	  months = now.month - birthday.month

	  if months < 0
	    years -= 1
	    months += 12
	  end

	  if years == 0
	    "#{months}ヶ月"
	  else
	    "#{years}歳#{months}ヶ月"
	  end
	end

end
