class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"

  has_many :event_attendings, foreign_key: :attended_events_id
  has_many :attendees, through: :event_attendings, source: :event_attendee
end
