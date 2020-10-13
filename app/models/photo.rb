class Photo < ApplicationRecord
  has_one_attached :image

  belongs_to :event
  belongs_to :contact
end
