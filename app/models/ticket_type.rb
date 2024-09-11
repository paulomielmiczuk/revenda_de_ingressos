class TicketType < ApplicationRecord
  belongs_to :event
  has_many :tickets, dependent: :destroy
  monetize :price_cents
end
