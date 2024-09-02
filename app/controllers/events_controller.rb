class EventsController < ApplicationController
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
    @my_events = Event.where(user: current_user)
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :date)
  end
end
