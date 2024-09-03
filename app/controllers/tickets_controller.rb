class TicketsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tickets = Ticket.where(user_id: current_user.id)
  end

  def new
    @event = Event.find(params[:event_id])
    @ticket = Ticket.new
  end

  def create
    @event = Event.find(params[:event_id])
    @ticket = Ticket.new(ticket_params)
    @ticket.event = @event
    @ticket.user = current_user
    if @ticket.save
      redirect_to tickets_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:id)
  end
end
