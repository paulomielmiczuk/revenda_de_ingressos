class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :event

  monetize :price_cents
  # validates :ticket_type, presence: true
end
