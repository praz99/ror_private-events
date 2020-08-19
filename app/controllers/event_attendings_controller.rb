# class EventAttendingsController < ApplicationController
#   def new
#     @event = Event.find(params[:event_id])
#     @event_attending = EventAttending.new
#   end

#   def create
#     @event = Event.find(params[:event_id])
#     @event_attending = EventAttending.new
#     if params[:event_attending]
#       params[:event_attending][:event_attendee_id].each do |x|
#         @event_attending.event_attendee = User.find(x.to_i)
#         @event_attending.attended_events = @event
#       end
#       flash[:success] = 'Event successfully created'
#       redirect_to user_path(@event.creator)
#     else
#       flash[:error] = 'Something went wrong'
#       render 'new'
#     end
#   end

#   def show
#     @event_attending = EventAttending.find(params[:id])
#   end

#   def att_params
#     params.raquire(:event_attending).permit(:event_attendee_id, :attended_events_id)
#   end
# end
