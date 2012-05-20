# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120519234325) do

  create_table "event_attendances", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.boolean  "present",    :default => true
    t.boolean  "late",       :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "events", :force => true do |t|
    t.date     "date"
    t.string   "name"
    t.text     "description"
    t.string   "document"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "positions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "semesters", :force => true do |t|
    t.string   "semester"
    t.date     "year"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "transactions", :force => true do |t|
    t.integer  "user_id"
    t.date     "date"
    t.text     "description"
    t.decimal  "amount",      :precision => 8, :scale => 2
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "user_positions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "position_id"
    t.integer  "semester_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "pledge_name"
    t.string   "class_name"
    t.date     "birthday"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role",            :default => "user"
    t.string   "phone"
    t.boolean  "alumni",          :default => false
    t.string   "password_digest"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

end
