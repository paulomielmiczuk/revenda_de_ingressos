class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :quantity, :ticket_type, presence: true
end
