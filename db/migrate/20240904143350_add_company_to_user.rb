class AddCompanyToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :company, :boolean
  end
end
