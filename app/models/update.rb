class Update < ApplicationRecord
  belongs_to :event
  belongs_to :contact

  validates :text, presence: true
end
