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

ActiveRecord::Schema[7.0].define(version: 2023_10_13_023733) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "properties", force: :cascade do |t|
    t.string "operation_type"
    t.string "address"
    t.string "property_type"
    t.integer "bedroom"
    t.integer "bathroom"
    t.integer "area"
    t.text "description"
    t.string "photo_url"
    t.boolean "active"
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

  create_table "user_property_rents", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_user_property_rents_on_property_id"
    t.index ["user_id"], name: "index_user_property_rents_on_user_id"
  end

  create_table "user_property_sales", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_user_property_sales_on_property_id"
    t.index ["user_id"], name: "index_user_property_sales_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  add_foreign_key "property_users", "properties"
  add_foreign_key "property_users", "users"
  add_foreign_key "user_property_rents", "properties"
  add_foreign_key "user_property_rents", "users"
  add_foreign_key "user_property_sales", "properties"
  add_foreign_key "user_property_sales", "users"
end
