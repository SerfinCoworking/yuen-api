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

ActiveRecord::Schema.define(version: 2021_06_26_145349) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "accounts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "account_type_id", null: false
    t.bigint "company_id", null: false
    t.string "name"
    t.string "account_alias"
    t.string "cbu"
    t.string "description"
    t.decimal "balance", default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_type_id"], name: "index_accounts_on_account_type_id"
    t.index ["company_id"], name: "index_accounts_on_company_id"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "address"
    t.string "phone"
    t.string "logo"
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

  create_table "customer_categories", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_customer_categories_on_company_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.string "address"
    t.string "phone"
    t.string "cuit"
    t.string "email"
    t.string "organization"
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_customers_on_category_id"
    t.index ["company_id"], name: "index_customers_on_company_id"
  end

  create_table "price_lists", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_price_lists_on_company_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.bigint "parent_id"
    t.bigint "company_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_product_categories_on_company_id"
    t.index ["parent_id"], name: "index_product_categories_on_parent_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "barcode"
    t.string "name"
    t.text "description"
    t.bigint "company_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "unity_id", null: false
    t.decimal "quantity_per_unit"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["company_id"], name: "index_products_on_company_id"
    t.index ["unity_id"], name: "index_products_on_unity_id"
  end

  create_table "provider_categories", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_provider_categories_on_company_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "address"
    t.string "phone"
    t.string "cuit"
    t.string "webpage"
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_providers_on_category_id"
    t.index ["company_id"], name: "index_providers_on_company_id"
  end

  create_table "purchase_products", force: :cascade do |t|
    t.bigint "purchase_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.integer "presentation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "expiry_date"
    t.decimal "cost_price", default: "0.0"
    t.decimal "total_line", default: "0.0"
    t.index ["product_id"], name: "index_purchase_products_on_product_id"
    t.index ["purchase_id"], name: "index_purchase_products_on_purchase_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "provider_id", null: false
    t.bigint "company_id", null: false
    t.integer "status"
    t.decimal "total_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "reference_number"
    t.date "date"
    t.datetime "price_list_updated_date"
    t.index ["company_id"], name: "index_purchases_on_company_id"
    t.index ["provider_id"], name: "index_purchases_on_provider_id"
  end

  create_table "stock_locations", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_stock_locations_on_company_id"
  end

  create_table "unities", force: :cascade do |t|
    t.integer "unity_type"
    t.string "name"
    t.string "symbol"
    t.decimal "equivalence"
    t.string "equivalence_unit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  add_foreign_key "accounts", "account_types"
  add_foreign_key "accounts", "companies"
  add_foreign_key "accounts", "users"
  add_foreign_key "company_users", "companies"
  add_foreign_key "company_users", "users"
  add_foreign_key "customer_categories", "companies"
  add_foreign_key "customers", "companies"
  add_foreign_key "customers", "customer_categories", column: "category_id"
  add_foreign_key "price_lists", "companies"
  add_foreign_key "product_categories", "companies"
  add_foreign_key "products", "companies"
  add_foreign_key "products", "product_categories", column: "category_id"
  add_foreign_key "products", "unities"
  add_foreign_key "provider_categories", "companies"
  add_foreign_key "providers", "companies"
  add_foreign_key "providers", "provider_categories", column: "category_id"
  add_foreign_key "purchase_products", "products"
  add_foreign_key "purchase_products", "purchases"
  add_foreign_key "purchases", "companies"
  add_foreign_key "purchases", "providers"
  add_foreign_key "stock_locations", "companies"
  add_foreign_key "users", "companies", column: "current_company_id"
end
