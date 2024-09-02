class TicketsController < ApplicationController
  def index
    @tickets = Ticket.joins(:event).where.not(events: { user_id: current_user.id })
  end
end
