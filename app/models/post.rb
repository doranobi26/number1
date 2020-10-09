class Post < ApplicationRecord

  validates :title, presence: true
  validates :title, length: { maximum: 15 }
  validates :caption, presence: true
  validates :caption,  length: { maximum: 300 }

  validate :presence_images

  belongs_to :user
  belongs_to :category

  accepts_attachments_for :pictures, attachment: :picture

  private
  def presence_images
    errors.add(:posts, "can't be blank") if images.size == 0
  end
end
