class AddAvailableToTickets < ActiveRecord::Migration[7.1]
  def change
    add_column :tickets, :available, :boolean
  end
end
