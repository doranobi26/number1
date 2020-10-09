class Category < ApplicationRecord

  has_many :posts
  validates :group, presence: true
end
