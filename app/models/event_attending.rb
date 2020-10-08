class EventAttending < ApplicationRecord
  belongs_to :event_attendee, class_name: 'User'
  belongs_to :attended_events, class_name: 'Event'
end
