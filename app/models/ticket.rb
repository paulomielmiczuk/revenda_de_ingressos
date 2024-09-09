class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_one_attached :image
  monetize :price_cents
  # validates :ticket_type, presence: true

  private

  def broadcast_ticket
    if user_changed?
      puts '*' * 100
      puts user_id_was
      puts '*' * 100
      Turbo::StreamsChannel.broadcast_remove_to(
        "user_#{user_id_was}",
        target: self
      )
    end
  end
end
