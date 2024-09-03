class RemoveColumnsFromTickets < ActiveRecord::Migration[7.1]
  def change
    remove_column :tickets, :quantity, :integer
    remove_column :tickets, :ticket_type, :string
  end
end
