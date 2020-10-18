class Update < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :event
  belongs_to :contact

  validates :text, presence: true
end
