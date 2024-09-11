class AddPriceToTicketTypes < ActiveRecord::Migration[7.1]
  def change
    add_monetize :ticket_types, :price, currency: { present: false }
  end
end
