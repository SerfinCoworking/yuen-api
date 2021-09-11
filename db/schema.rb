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

ActiveRecord::Schema.define(version: 2021_04_20_001328) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "address"
    t.string "phone"
    t.string "logo"
    t.string "web_page"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "company_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_company_users_on_company_id"
    t.index ["user_id"], name: "index_company_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "email_verified"
    t.string "email"
    t.string "auth0_id"
    t.string "username"
    t.string "phone_number"
    t.boolean "phone_verified"
    t.string "picture"
    t.string "name"
    t.string "nickname"
    t.boolean "blocked"
    t.string "given_name"
    t.string "family_name"
    t.bigint "current_company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["auth0_id"], name: "index_users_on_auth0_id", unique: true
    t.index ["current_company_id"], name: "index_users_on_current_company_id"
  end

  add_foreign_key "company_users", "companies"
  add_foreign_key "company_users", "users"
  add_foreign_key "users", "companies", column: "current_company_id"
end
