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

ActiveRecord::Schema.define(version: 2021_08_30_131153) do

  create_table "inns", force: :cascade do |t|
    t.string "name"
    t.text "introduction"
    t.integer "price"
    t.string "adress"
    t.string "image"
    t.string "user_id"
    t.string "reservation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "total_price"
    t.date "start_time"
    t.date "finish_time"
    t.integer "user_id"
    t.integer "inn_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "number"
  end

  create_table "users", force: :cascade do |t|
    t.integer "name"
    t.string "email"
    t.string "password"
    t.string "icon_image"
    t.text "introduction"
    t.integer "reservation_id"
    t.integer "inn_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_confirmation"
  end

end
