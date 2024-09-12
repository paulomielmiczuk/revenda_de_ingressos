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
    created_tickets = []
    params[:ticket_types].each do |ticket_type_id, quantity|
      quantity = quantity.to_i
      next if quantity <= 0

      ticket_type = TicketType.find(ticket_type_id)
      quantity.times do
        ticket = Ticket.create!(user: current_user, ticket_type:, available: true)
        created_tickets << ticket
      end
    end

    redirect_to tickets_path
    # if created_tickets.any?
    #   redirect_to add_images_tickets_path(ticket_ids: created_tickets.map(&:id))
    # else
    #   redirect_to tickets_path, notice: 'Nenhum ticket adicionado'
    # end
  end

  # def add_images
  #   @tickets = Ticket.where(id: params[:ticket_ids])
  # end

  # def upload_images
  #   @tickets = Ticket.where(id: params[:ticket_ids])
  #   raise
  #   if params[:ticket] && params[:ticket][:photo]
  #     @ticket.photo.attach(params[:ticket][:photo])
  #     redirect_to tickets_path, notice: 'Arquivo enviado'
  #   else
  #     redirect_to tickets_path, alert: 'Nenhum arquivo selecionado'
  #   end
  # end

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
    params.require(:ticket).permit(:photo, :available, ticket_types: %i[id quantity])
  end
end
