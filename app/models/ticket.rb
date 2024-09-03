class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :quantity, :type, presence: true
end
