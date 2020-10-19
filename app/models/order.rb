class Order < ApplicationRecord
  belongs_to :event
  belongs_to :contact
end
