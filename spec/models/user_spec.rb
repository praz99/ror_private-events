require 'rails_helper'

RSpec.describe User, type: :model do
  context 'ActiveModelValidations' do
    before(:all) do
      @user1 = create(:user)
    end
    it 'is valid with valid attributes' do
      expect(@user1).to be_valid
    end

    it 'has a valid username' do
      user2 = build(:user)
      expect(user2).to_not be_valid
    end

    it 'should have name of minimum 5 characters' do
      user1 = build(:user, username: 'xyz', name: 'xyzabc')
      expect(user1).to be_valid
    end

    it 'should not accept name with less than 5 characters' do
      user1 = build(:user, name: 'abc')
      expect(user1).to_not be_valid
    end

    it 'should have username of minimum 3 characters' do
      user1 = build(:user, username: 'xyz')
      expect(user1).to be_valid
    end

    it 'should not accept username with less than 3 characters' do
      user1 = build(:user, username: 'x')
      expect(user1).to_not be_valid
    end

    it 'should have a unique username' do
      user1 = build(:user, name: 'xyzabc')
      expect(user1).to_not be_valid
    end
  end

  context 'ActiveRecordAssociations' do
    it 'should have many created_events' do
      e = described_class.reflect_on_association(:created_events)
      expect(e.macro).to eq(:has_many)
    end

    it 'should have many event_attendings' do
      e = described_class.reflect_on_association(:event_attendings)
      expect(e.macro).to eq(:has_many)
    end

    it 'should have many attended_events' do
      e = described_class.reflect_on_association(:attended_events)
      expect(e.macro).to eq(:has_many)
    end
  end
end
