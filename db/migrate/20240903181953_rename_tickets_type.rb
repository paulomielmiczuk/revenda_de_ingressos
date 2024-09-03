class RenameTicketsType < ActiveRecord::Migration[7.1]
  def change
    rename_column :tickets, :type, :ticket_type
  end
end
