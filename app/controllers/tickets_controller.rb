class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: %i[new create]

  def index
    @tickets = Ticket.joins(ticket_type: :event)
                     .where(user: current_user)
                     .order('events.date ASC')
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
    @ticket_types = TicketType.where(event: @event)
  end

  def create
    ticket_params[:ticket_types].each do |ticket_type_id, quantity|
      quantity = quantity.to_i
      next if quantity <= 0

      ticket_type = TicketType.find(ticket_type_id)
      quantity.times do
        Ticket.create!(user: current_user, ticket_type: ticket_type, available: true)
      end
    end

    redirect_to tickets_path, notice: 'Tickets were successfully created.'
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy!
    redirect_to tickets_path
  end

  def update
    @ticket = Ticket.find(params[:id])
    @ticket.update(ticket_params)

    render turbo_stream: turbo_stream.update(@ticket, partial: "tickets/ticket",
      locals: { ticket: @ticket })
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def ticket_params
    params.permit(ticket_types: [:id, :quantity])
  end
end
