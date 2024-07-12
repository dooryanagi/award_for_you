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

  # ゲストユーザー用メールアドレス
  GUEST_USER_EMAIL = "guest@example.com"

  # ゲストユーザーログイン用にnameとpasswordを定義
  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guest_user"
    end
  end

  # ゲストユーザーか確認
  def guest_user?
    email == GUEST_USER_EMAIL
  end



end