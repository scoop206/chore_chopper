# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100730214223) do

  create_table "chores", :force => true do |t|
    t.string   "name"
    t.integer  "family_id"
    t.boolean  "no_day_tracking", :default => false
    t.boolean  "active",          :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chores_completed", :force => true do |t|
    t.integer  "chore_id"
    t.integer  "family_member_id"
    t.integer  "week"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chores_families", :id => false, :force => true do |t|
    t.integer "chore_id"
    t.integer "family_id"
    t.integer "week"
  end

  add_index "chores_families", ["chore_id"], :name => "index_chores_families_on_chore_id"
  add_index "chores_families", ["family_id"], :name => "index_chores_families_on_family_id"
  add_index "chores_families", ["week"], :name => "index_chores_families_on_week"

  create_table "chores_family_members", :force => true do |t|
    t.integer "chore_id"
    t.integer "family_member_id"
    t.integer "week"
  end

  add_index "chores_family_members", ["chore_id"], :name => "index_chores_family_members_on_chore_id"
  add_index "chores_family_members", ["family_member_id"], :name => "index_chores_family_members_on_family_member_id"

  create_table "chores_family_members_days", :id => false, :force => true do |t|
    t.integer "chore_family_member_id"
    t.integer "day_id"
    t.integer "week"
  end

  create_table "days", :force => true do |t|
    t.string   "name"
    t.integer  "day_of_week"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "families", :force => true do |t|
    t.string   "name"
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count"
    t.integer  "failed_login_count"
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "family_members", :force => true do |t|
    t.string   "name"
    t.integer  "family_id"
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count"
    t.integer  "failed_login_count"
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.boolean  "active",             :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
