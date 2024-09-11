class RemoveQuantityFromTicketType < ActiveRecord::Migration[7.1]
  def change
    remove_column :ticket_types, :quantity
  end
end
