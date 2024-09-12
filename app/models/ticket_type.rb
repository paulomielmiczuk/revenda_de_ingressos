class TicketType < ApplicationRecord
  belongs_to :event
  has_many :tickets, dependent: :destroy
  monetize :price_cents
  validates :type_of_ticket, :price_cents, presence: true
end
