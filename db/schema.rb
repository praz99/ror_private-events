# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_17_152446) do

  create_table "event_attendings", force: :cascade do |t|
    t.integer "attended_events_id"
    t.integer "event_attendee_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attended_events_id"], name: "index_event_attendings_on_attended_events_id"
    t.index ["event_attendee_id"], name: "index_event_attendings_on_event_attendee_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "events_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "creator_id"
    t.string "title"
    t.text "description"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "event_attendings", "events", column: "attended_events_id"
  add_foreign_key "event_attendings", "users", column: "event_attendee_id"
end
