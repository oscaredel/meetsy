class Event < ApplicationRecord
  has_one_attached :image # is automatically purged if the event is destroyed

  belongs_to :organiser, dependent: :destroy
  has_many :responses, dependent: :destroy

  validates :name, :description, presence: true
end
