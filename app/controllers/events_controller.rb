class EventsController < ApplicationController
  before_action :set_event, only: [:index, :show, :new, :create]
  def index
    @events = Event.all
  end

  def show 
    
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  private

  def set_event
    @event = Event.find(params[:creator_id])
  end
  
  def event_params
    params.require(:event).permit(:description, :events_date)
  end
end
