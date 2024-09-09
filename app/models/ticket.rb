class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_one_attached :image
  monetize :price_cents
  # validates :ticket_type, presence: true
end
