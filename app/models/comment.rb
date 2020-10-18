class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :contact

  validates :text, presence: true
end
