require 'rails_helper'
RSpec.describe EventAttending, type: :model do
  it 'belongs to a event_attendee' do
    e = described_class.reflect_on_association(:event_attendee)
    expect(e.macro).to eq(:belongs_to)
  end

  it 'belongs to a event_attendee' do
    e = described_class.reflect_on_association(:attended_events)
    expect(e.macro).to eq(:belongs_to)
  end
end
