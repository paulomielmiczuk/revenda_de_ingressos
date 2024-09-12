class RemoveColumnsFromTickets < ActiveRecord::Migration[7.1]
  def change
    remove_column :tickets, :event_id
    remove_column :tickets, :ticket_type
    remove_column :tickets, :price_cents
  end
end
