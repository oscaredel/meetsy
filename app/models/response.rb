class Response < ApplicationRecord
  belongs_to :event
  enum attendance: { yes: '1', maybe: '2', no: '0' }
  validates :attendance, :name, :email, presence: true
  validates :email, uniqueness: { scope: :event }
end
