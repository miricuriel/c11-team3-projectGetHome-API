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

ActiveRecord::Schema[7.0].define(version: 2023_10_10_222021) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "properties", force: :cascade do |t|
    t.string "operation_type"
    t.string "address"
    t.bigint "property_type_id", null: false
    t.integer "bedroom"
    t.integer "bathroom"
    t.integer "area"
    t.text "description"
    t.string "photo_url"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_type_id"], name: "index_properties_on_property_type_id"
  end

  create_table "property_rents", force: :cascade do |t|
    t.bigint "property_id", null: false
    t.integer "monthly_rent"
    t.integer "maintenance"
    t.boolean "pets_allowed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_property_rents_on_property_id"
  end

  create_table "property_sales", force: :cascade do |t|
    t.bigint "property_id", null: false
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_property_sales_on_property_id"
  end

  create_table "property_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "property_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "property_id", null: false
    t.boolean "favorite"
    t.boolean "contacted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_property_users_on_property_id"
    t.index ["user_id"], name: "index_property_users_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_property_rents", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "property_rent_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_rent_id"], name: "index_user_property_rents_on_property_rent_id"
    t.index ["user_id"], name: "index_user_property_rents_on_user_id"
  end

  create_table "user_property_sales", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "property_sale_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_sale_id"], name: "index_user_property_sales_on_property_sale_id"
    t.index ["user_id"], name: "index_user_property_sales_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "password"
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "properties", "property_types"
  add_foreign_key "property_rents", "properties"
  add_foreign_key "property_sales", "properties"
  add_foreign_key "property_users", "properties"
  add_foreign_key "property_users", "users"
  add_foreign_key "user_property_rents", "property_rents"
  add_foreign_key "user_property_rents", "users"
  add_foreign_key "user_property_sales", "property_sales"
  add_foreign_key "user_property_sales", "users"
  add_foreign_key "users", "roles"
end