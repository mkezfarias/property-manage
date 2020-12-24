# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_19_193829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "appointments", force: :cascade do |t|
    t.bigint "property_id"
    t.integer "tenant_id"
    t.integer "rep_id"
    t.date "scheduled_date"
    t.time "scheduled_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_appointments_on_property_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.bigint "property_id"
    t.integer "tenant_id"
    t.integer "landlord_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "signed"
    t.index ["property_id"], name: "index_contracts_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "kind_of_property"
    t.string "title"
    t.string "address"
    t.string "map"
    t.integer "rooms"
    t.integer "bathrooms"
    t.date "availability"
    t.integer "price"
    t.integer "fees"
    t.integer "size"
    t.integer "parking"
    t.boolean "pets"
    t.boolean "furnished"
    t.text "description"
    t.integer "views"
    t.string "pictures", array: true
    t.bigint "landlord_id"
    t.string "type"
    t.string "street_name"
    t.integer "house_number"
    t.string "neighborhood"
    t.string "city"
    t.string "municipality"
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "lease"
    t.float "security_deposit"
    t.float "min_lease"
    t.boolean "verified"
    t.boolean "gated"
    t.string "rules", array: true
    t.string "perks", array: true
    t.string "close_to", array: true
    t.boolean "has_contract"
    t.integer "visits_count"
    t.index ["landlord_id"], name: "index_properties_on_landlord_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "url", default: "", null: false
    t.boolean "tenant", default: true, null: false
    t.boolean "landlord", default: false, null: false
    t.boolean "rep", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "appointments", "properties"
  add_foreign_key "contracts", "properties"
  add_foreign_key "properties", "users", column: "landlord_id"
end
