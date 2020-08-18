class CreateEventAttendings < ActiveRecord::Migration[6.0]
  def change
    create_table :event_attendings do |t|
      t.references :attended_events, foreign_key: { to_table: :events }
      t.references :event_attendee, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
