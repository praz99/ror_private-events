class EventsController < ApplicationController
  before_action :set_event, only: [:index, :show, :new, :create]
  before_action :set_current_user, only: [:show, :index, :new, :attended_event, :add_attended_event]
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

  def attended_event
    @events = Event.all
  end

  def add_attended_event
    event_ids = params[:event_ids]
    attended_events = event_ids.collect { |id| Event.find(id) }
    @current_user.attended_events = attended_events
  end

  private

  def set_event
    # @event = Event.find_by_id(params[:creator_id])
    @event = Event.find_by(id: params[:creator_id])
  end

  def set_current_user
    redirect_to signup_path unless current_user
    @current_user = current_user
  end

  def event_params
    params.require(:event).permit(:title, :description, :events_date)
  end
end
