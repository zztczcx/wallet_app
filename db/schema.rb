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

ActiveRecord::Schema.define(version: 2021_07_31_102023) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "user_events", force: :cascade do |t|
    t.string "type", null: false
    t.integer "user_id", null: false
    t.text "data", null: false
    t.text "metadata", null: false
    t.datetime "created_at", null: false
    t.index ["user_id"], name: "index_user_events_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.boolean "deleted", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wallet_events", force: :cascade do |t|
    t.string "type", null: false
    t.integer "wallet_id", null: false
    t.text "data", null: false
    t.text "metadata", null: false
    t.datetime "created_at", null: false
    t.index ["wallet_id"], name: "index_wallet_events_on_wallet_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.decimal "balance", precision: 10, scale: 2
    t.decimal "credit", precision: 10, scale: 2
    t.boolean "deleted", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
