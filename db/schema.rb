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

ActiveRecord::Schema.define(version: 2020_05_11_194410) do

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.integer "map_x"
    t.integer "map_y"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_cities_on_name"
  end

  create_table "connections", force: :cascade do |t|
    t.integer "city_id", null: false
    t.integer "connected_city_id"
    t.integer "cost", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_connections_on_city_id"
    t.index ["connected_city_id"], name: "index_connections_on_connected_city_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.json "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "postcards", force: :cascade do |t|
    t.integer "city_id", null: false
    t.string "name"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_postcards_on_city_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.integer "postcard_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["postcard_id"], name: "index_tags_on_postcard_id"
  end

  add_foreign_key "connections", "cities"
  add_foreign_key "postcards", "cities"
  add_foreign_key "tags", "postcards"
end
