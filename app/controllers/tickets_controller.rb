class TicketsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tickets = Ticket.joins(:event)
                     .where(user: current_user)
                     .order('events.date ASC')
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @event = Event.find(params[:event_id])
    @ticket = Ticket.new
    @tickets_by_type = Ticket.where(event: @event).group(:ticket_type).count
  end

  def create
    @event = Event.find(params[:event_id])

    normal_ticket_quantity = params[:ticket][:normal_ticket_quantity].to_i
    if normal_ticket_quantity.positive?
      normal_ticket_quantity.times do
        Ticket.create!(ticket_type: 'inteira', event: @event, user: current_user, available: true)
      end
    end

    half_price_quantity = params[:ticket][:half_price_quantity].to_i
    if half_price_quantity.positive?
      half_price_quantity.times do
        Ticket.create!(ticket_type: 'meia', event: @event, user: current_user, available: true)
      end
    end
    redirect_to tickets_path, notice: 'Tickets added!'
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy!
    redirect_to tickets_path
  end

  def update
    @ticket = Ticket.find(params[:id])
    @ticket.update(ticket_params)

    render turbo_stream: turbo_stream.replace(@ticket, partial: "tickets/ticket",
      locals: { ticket: @ticket })
  end

  private

  def ticket_params
    params.require(:ticket).permit(:available, ticket_type: [], quantity: [], half_price_quantity: [])
  end
end
