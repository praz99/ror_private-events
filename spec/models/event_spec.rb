require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:all) do
    create(:user) do |user|
      @event1 = user.created_events.create(attributes_for(:event))
    end
  end

  context 'ActiveModelValidations' do
    it 'is valid with valid attributes' do
      expect(@event1).to be_valid
    end

    it 'has a title' do
      event1 = build(:event, title: nil)
      expect(event1).to_not be_valid
    end

    it 'has a description' do
      event1 = build(:event, description: nil)
      expect(event1).to_not be_valid
    end

    it 'has a events_date' do
      event1 = build(:event, events_date: nil)
      expect(event1).to_not be_valid
    end
  end

  context 'ActiveRecordAssociations' do
    it 'belongs to a creator' do
      c = described_class.reflect_on_association(:creator)
      expect(c.macro).to eq(:belongs_to)
    end

    it 'has many event_attendings' do
      c = described_class.reflect_on_association(:event_attendings)
      expect(c.macro).to eq(:has_many)
    end

    it 'has many attendees' do
      c = described_class.reflect_on_association(:attendees)
      expect(c.macro).to eq(:has_many)
    end
  end
end
