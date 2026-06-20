# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_06_20_222608) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "exercise_entries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "movement_id", null: false
    t.text "notes"
    t.integer "position"
    t.integer "reps"
    t.integer "sets"
    t.datetime "updated_at", null: false
    t.decimal "weight", precision: 8, scale: 2
    t.bigint "workout_id", null: false
    t.index ["movement_id"], name: "index_exercise_entries_on_movement_id"
    t.index ["workout_id"], name: "index_exercise_entries_on_workout_id"
  end

  create_table "movements", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "current_cue"
    t.string "name"
    t.text "notes"
    t.text "progression_rule"
    t.string "tag"
    t.datetime "updated_at", null: false
    t.index ["tag"], name: "index_movements_on_tag", unique: true
  end

  create_table "workouts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date"
    t.text "raw_notes"
    t.datetime "updated_at", null: false
    t.string "workout_type"
  end

  add_foreign_key "exercise_entries", "movements"
  add_foreign_key "exercise_entries", "workouts"
end
