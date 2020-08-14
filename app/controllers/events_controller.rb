class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def event_params
    params.require(:event).permit(:name, :description, :events_date)
  end
end
