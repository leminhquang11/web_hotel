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

ActiveRecord::Schema.define(version: 20191211132658) do

  create_table "booking_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.text     "description"
    t.string   "address"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "review_images", force: :cascade do |t|
    t.string   "link"
    t.integer  "service_review_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["service_review_id"], name: "index_review_images_on_service_review_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "schedule_item_images", force: :cascade do |t|
    t.string   "link"
    t.integer  "schedule_item_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["schedule_item_id"], name: "index_schedule_item_images_on_schedule_item_id"
  end

  create_table "schedule_items", force: :cascade do |t|
    t.text     "description"
    t.text     "option"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "schedule_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_schedule_items_on_category_id"
    t.index ["schedule_id"], name: "index_schedule_items_on_schedule_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "service_bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "service_id"
    t.string   "booking_user"
    t.text     "booking_address"
    t.integer  "quantity"
    t.float    "unit_price"
    t.float    "total_price"
    t.text     "confirm_secret_key"
    t.integer  "payment_method_id"
    t.integer  "booking_status_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["booking_status_id"], name: "index_service_bookings_on_booking_status_id"
    t.index ["payment_method_id"], name: "index_service_bookings_on_payment_method_id"
    t.index ["service_id"], name: "index_service_bookings_on_service_id"
    t.index ["user_id"], name: "index_service_bookings_on_user_id"
  end

  create_table "service_images", force: :cascade do |t|
    t.string   "link"
    t.integer  "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_service_images_on_service_id"
  end

  create_table "service_reviews", force: :cascade do |t|
    t.text     "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_service_reviews_on_service_id"
    t.index ["user_id"], name: "index_service_reviews_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "option"
    t.float    "price"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "provider_id"
    t.integer  "category_id"
    t.integer  "place_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_services_on_category_id"
    t.index ["place_id"], name: "index_services_on_place_id"
    t.index ["provider_id"], name: "index_services_on_provider_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "avatar"
    t.string   "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

end
