class Contact < ApplicationRecord
  has_one_attached :image
  has_many :updates, dependent: :destroy

  validates :name, :email, presence: true
  validates :email, format: { with: /(.+)@(.+)/, message: "not valid" }
end
