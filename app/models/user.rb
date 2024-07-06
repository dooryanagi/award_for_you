class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :awards, dependent: :destroy
  has_many :applauses, dependent: :destroy
  has_many :waiting_events, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :praises, dependent: :destroy

  # バリデーション
  validates :name, presence: true, length: {in: 2..20}



end