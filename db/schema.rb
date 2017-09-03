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

ActiveRecord::Schema.define(version: 20170903223454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"

  create_table "articles", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.string "authors"
    t.string "genres"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", id: :serial, force: :cascade do |t|
    t.string "name"
    t.boolean "available"
    t.string "genres"
    t.string "authors"
    t.string "publisher"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "name_size_prime", default: false
  end

  create_table "lists", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "single_sorts", id: :serial, force: :cascade do |t|
    t.integer "list_id"
    t.integer "book_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
