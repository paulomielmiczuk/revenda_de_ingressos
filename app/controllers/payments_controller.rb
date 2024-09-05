class PaymentsController < ApplicationController
  def new
    @orders = current_user.orders.where(processed: false)
  end
end
