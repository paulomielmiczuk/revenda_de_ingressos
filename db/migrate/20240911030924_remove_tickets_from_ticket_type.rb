class RemoveTicketsFromTicketType < ActiveRecord::Migration[7.1]
  def change
    remove_reference :ticket_types, :ticket, foreign_key: true
    add_reference :tickets, :ticket_type, foreign_key: true
  end
end
