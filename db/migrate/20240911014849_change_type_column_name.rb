class ChangeTypeColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :ticket_types, :type, :ticket_type
  end
end
