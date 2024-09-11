class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :ticket_type
  has_one_attached :image
end
