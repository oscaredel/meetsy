class Photo < ApplicationRecord
  has_one_attached :image
  has_many :comments, as: :commentable, dependent: :destroy

  belongs_to :event
  belongs_to :contact
end
