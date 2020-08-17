class EventsController < ApplicationController
  before_action :set_event, only: [:index, :show, :new, :create]
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.created_events.build
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
    # @event = Event.find_by_id(params[:creator_id])
    @event = Event.find_by(id: params[:creator_id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :events_date)
  end
end
