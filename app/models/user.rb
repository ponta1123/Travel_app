class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 def self.guest
   find_or_create_by!(email: "guest@aiu.com") do |user|
     user.password = SecureRandom.urlsafe_base64
     user.nick_name = "ゲスト"
     user.prefectural = "ゲスト大分県"
     user.city = "ゲストシティ"
   end
 end

  has_many :posts, dependent: :destroy

end
