class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, length: { maximum: 10 }
  validates :name, length: { minimum: 2 }
  validates :name, presence: true
  validates :introduction, length: { maximum: 30 }
  attachment :profile_image

  has_many :posts
end
