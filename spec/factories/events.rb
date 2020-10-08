FactoryBot.define do
  factory :event do
    events_date { DateTime.now + 1.week }
    title { 'Hello' }
    description { 'World' }
  end
end
