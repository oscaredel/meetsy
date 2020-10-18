class Contact < ApplicationRecord
  has_one_attached :image
  has_many :updates, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, :email, presence: true
  validates :email, format: { with: /(.+)@(.+)/, message: "not valid" }
end
