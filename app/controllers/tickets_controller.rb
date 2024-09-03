class TicketsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tickets = Ticket.where(user_id: current_user.id)
  end
end
