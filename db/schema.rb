ActiveRecord::Schema.define(version: 2021_05_08_135659) do

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
    t.string "name"
    t.string "account_alias"
    t.string "cbu"
    t.string "description"
    t.decimal "balance", default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_type_id"], name: "index_accounts_on_account_type_id"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "address"
    t.string "phone"
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

  create_table "product_categories", force: :cascade do |t|
    t.bigint "parent_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["company_id"], name: "index_products_on_company_id"
  end

  create_table "stock_locations", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_stock_locations_on_company_id"
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["auth0_id"], name: "index_users_on_auth0_id", unique: true
  end

  add_foreign_key "company_users", "companies"
  add_foreign_key "company_users", "users"
  add_foreign_key "products", "companies"
  add_foreign_key "stock_locations", "companies"
end