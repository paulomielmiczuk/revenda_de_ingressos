class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @events = Event.order(:date)
    if params[:query].present?
      @events = @events.search_by_title_and_location(params[:query])
    end
  end

  def show
    @event = Event.find(params[:id])
    @marker = [{
      lat: @event.latitude,
      lng: @event.longitude
      # marker_html: render_to_string(partial: "marker")
    }]
    @ticket = Ticket.new
  end

  def new
    if current_user.company? == true
      @event = Event.new
    end
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
    redirect_to events_path
  end

  def my_events
    @my_events = Event.where(user: current_user).order(:date)
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :date, :photo)
  end
end
