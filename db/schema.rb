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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131028094051) do

  create_table "calculation_requests", force: true do |t|
    t.string   "package"
    t.string   "function"
    t.string   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ocpu_callbacks", force: true do |t|
    t.string   "value"
    t.string   "stdout"
    t.string   "source"
    t.string   "console"
    t.string   "info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "session_code"
  end

  create_table "ocpu_packages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
