class Response < ApplicationRecord
  belongs_to :event

  enum attendance: { yes: 1, maybe: 2, no: 0 }

  validates :attendance, :name, :email, presence: true
  validates :email,
            format: { with: /(.+)@(.+)/, message: "not valid" },
            uniqueness: { case_sensitive: false, scope: :event }
end
