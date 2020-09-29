class Response < ApplicationRecord
  belongs_to :event
  enum attendence: { yes: '1', maybe: '2', no: '0' }
  validates :attendence, :name, :email, presence: true
  validates :email, uniqueness: { scope: :event }
end
