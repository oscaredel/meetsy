class Order < ApplicationRecord
  belongs_to :event
  belongs_to :contact
  validates_uniqueness_of :event_id
end
