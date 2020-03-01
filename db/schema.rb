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

ActiveRecord::Schema.define(version: 2020_03_01_201823) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "plot"
    t.string "poster", default: "https://i.imgur.com/v7fzWHO.jpg"
    t.bigint "projection_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["projection_id"], name: "index_movies_on_projection_id"
  end

  create_table "projections", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "reservation_id"
    t.date "showtime"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_projections_on_movie_id"
    t.index ["reservation_id"], name: "index_projections_on_reservation_id"
    t.index ["showtime", "movie_id"], name: "index_projections_on_showtime_and_movie_id", unique: true
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "projection_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["projection_id"], name: "index_reservations_on_projection_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "mobile"
    t.string "email"
    t.string "id_number"
    t.bigint "reservation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reservation_id"], name: "index_users_on_reservation_id"
  end

end
