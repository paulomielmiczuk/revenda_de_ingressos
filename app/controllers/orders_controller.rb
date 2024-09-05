class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.where(user: current_user, processed: false)
    @total_price = @orders.sum { |order| order.ticket.price_cents * order.quantity } / 100.0
  end

  def create_checkout_session
    @orders = Order.where(user: current_user, processed: false)
    @total_price = @orders.sum { |order| order.ticket.price_cents * order.quantity }

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: @orders.map do |order|
        {
          price_data: {
            currency: 'brl',
            product_data: {
              name: order.ticket.ticket_type,
            },
            unit_amount: order.ticket.price_cents,
          },
          quantity: order.quantity,
        }
      end,
      mode: 'payment',
      success_url: "#{root_url}orders/success",
      cancel_url: "#{root_url}orders/cancel"
    )

    redirect_to session.url, allow_other_host: true
  end

  def success
    @orders = Order.where(user: current_user, processed: false)
    @orders.each do |order|
      order.update(processed: true)
      ticket = order.ticket
      ticket.update(user: current_user, available: false)
    end

    redirect_to tickets_path, notice: 'Your orders have been successfully processed.'
  end

  def cancel
    redirect_to orders_path, alert: 'Payment was canceled.'
  end

  def new
    @order = Order.new
    @order.user = current_user
    @event = Event.find(params[:event_id])
    @tickets_by_type = Ticket.where(event: @event, available: true).group(:ticket_type).count
  end

  def create
    @event = Event.find(params[:order][:event_id])
    ticket_types = @event.tickets.group(:ticket_type).count
    order_params = params[:order]

    ticket_types.each_key do |ticket_type|
      quantity = order_params["#{ticket_type}_quantity"].to_i
      if quantity.positive?
        tickets = Ticket.where(event: @event, ticket_type:).limit(quantity)
        tickets.each do |ticket|
          Order.create!(ticket:, user: current_user, quantity: 1, processed: false)
        end
      end
    end

    redirect_to orders_path, notice: 'Your order has been placed successfully.'
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy!
    redirect_to orders_path
  end

end
