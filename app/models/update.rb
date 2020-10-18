class Update < ApplicationRecord
  has_many :comments, as: :commentable
  belongs_to :event
  belongs_to :contact

  validates :text, presence: true
end
