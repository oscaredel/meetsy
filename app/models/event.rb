class Event < ApplicationRecord
  has_one_attached :image # is automatically purged if the event is destroyed

  belongs_to :organiser, dependent: :destroy, foreign_key: "contact_id", class_name: "Contact"
  has_many :responses, dependent: :destroy
  has_many :updates, dependent: :destroy

  validates :name, :description, presence: true
end
