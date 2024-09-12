class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @events = Event.order(:date)

    if params[:query].present?
      query = "%#{params[:query]}%"
      @events = @events.where("title LIKE ? OR location LIKE ?", query, query)
    end

    if params[:date].present?
      @events = @events.where(date: params[:date])
    end
  end

  def show
    @event = Event.find(params[:id])
    @marker = [{
      lat: @event.latitude,
      lng: @event.longitude,
      marker_html: render_to_string(partial: "marker")
    }]
    @ticket = Ticket.new
    @order = Order.new
    @order.user = current_user
    @post = Post.new
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: 'event updated!'
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy!
    redirect_to my_events_path
  end

  def my_events
    @my_events = Event.where(user: current_user).order(:date)
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :date, :photo, ticket_types_attributes: [:type_of_ticket, :price_cents, :_destroy, :id])
  end
end
