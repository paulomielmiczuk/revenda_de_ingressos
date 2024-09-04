class AddTypeToTicket < ActiveRecord::Migration[7.1]
  def change
    add_column :tickets, :ticket_type, :string
  end
end
