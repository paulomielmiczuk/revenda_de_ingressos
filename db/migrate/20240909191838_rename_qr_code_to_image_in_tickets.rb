class RenameQrCodeToImageInTickets < ActiveRecord::Migration[7.1]
  def change
    rename_column :tickets, :qr_code, :image
  end
end
