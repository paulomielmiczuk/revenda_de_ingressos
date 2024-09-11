class AddQuantityToTicketType < ActiveRecord::Migration[7.1]
  def change
    add_column :ticket_types, :quantity, :integer
    rename_column :ticket_types, :ticket_type, :type_of_ticket
  end
end
