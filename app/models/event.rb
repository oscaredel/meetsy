class Event < ApplicationRecord
  has_many :responses, dependent: :destroy
  validates :name, :description, :organiser_name, :organiser_email, presence: true

  validates :organiser_email,
            format: { with: /(.+)@(.+)/, message: "not valid" },
            uniqueness: { case_sensitive: false }
end
