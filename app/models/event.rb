class Event < ApplicationRecord
  has_many :responses, dependent: :destroy
  validates :name, :description, :organiser_name, :organiser_email, presence: true
end
