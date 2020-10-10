class Post < ApplicationRecord

  validates :title, presence: true
  validates :title, length: { maximum: 15 }
  validates :caption, presence: true
  validates :caption,  length: { maximum: 300 }

  validate :presence_pictures

  belongs_to :user
  belongs_to :category
  has_many :pictures, dependent: :destroy

  accepts_attachments_for :pictures, attachment: :picture

  private
  def presence_pictures
    errors.add(:posts, "can't be blank") if pictures.size == 0
  end
end
