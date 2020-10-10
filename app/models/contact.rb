class Contact < ApplicationRecord
  has_one_attached :image

  validates :name, :email, presence: true
  validates :email, format: { with: /(.+)@(.+)/, message: "not valid" }
end
