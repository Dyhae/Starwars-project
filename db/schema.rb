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

ActiveRecord::Schema.define(version: 2020_02_23_232435) do

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "birth_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "kind_id"
    t.integer "planet_id"
    t.index ["kind_id"], name: "index_characters_on_kind_id"
    t.index ["planet_id"], name: "index_characters_on_planet_id"
  end

  create_table "characters_starships", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "starship_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_characters_starships_on_character_id"
    t.index ["starship_id"], name: "index_characters_starships_on_starship_id"
  end

  create_table "kinds", force: :cascade do |t|
    t.string "name"
    t.string "classification"
    t.string "designation"
    t.string "average_lifespan"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "planet_id"
    t.index ["planet_id"], name: "index_kinds_on_planet_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "permalink"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "planets", force: :cascade do |t|
    t.string "name"
    t.integer "population"
    t.string "gravity"
    t.float "diameter"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "starships", force: :cascade do |t|
    t.string "name"
    t.string "model"
    t.string "starship_class"
    t.string "cost_in_credits"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "characters", "kinds"
  add_foreign_key "characters", "planets"
  add_foreign_key "characters_starships", "characters"
  add_foreign_key "characters_starships", "starships"
  add_foreign_key "kinds", "planets"
end
