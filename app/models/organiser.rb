class Organiser < ApplicationRecord
  has_one :event, dependent: :destroy

  validates :name, :email, presence: true
  validates :email, format: { with: /(.+)@(.+)/, message: "not valid" }
end
