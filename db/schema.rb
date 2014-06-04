# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120531055933) do

  create_table "admins", :force => true do |t|
    t.string   "email"
    t.string   "hash"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
    t.integer  "role_id"
    t.string   "request_hash"
    t.integer  "status"
  end

  create_table "areas", :force => true do |t|
    t.string   "name"
    t.text     "points"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "careers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clusters", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credit_cards", :force => true do |t|
    t.text     "number"
    t.integer  "ccv"
    t.integer  "expiry_month"
    t.integer  "expiry_year"
    t.integer  "user_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "amount"
  end

  create_table "cuisines", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cuisines_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "cuisine_id"
  end

  create_table "d_meals", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "restaurant_id"
    t.integer  "cuisine_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "meal_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "status"
    t.integer  "owner_id"
    t.boolean  "vegetarian"
    t.text     "meal_info"
    t.text     "nutr_calories"
    t.text     "nutr_protein"
    t.text     "nutr_carbs"
    t.text     "nutr_cholesterol"
    t.text     "nutr_fats"
    t.text     "nutr_sodium"
    t.float    "price"
  end

  create_table "d_restaurants", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "lat"
    t.float    "lng"
    t.integer  "admin_id"
    t.integer  "status"
    t.integer  "cuisine_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "restaurant_id"
    t.integer  "owner_id"
    t.integer  "cluster_id"
    t.string   "phone"
    t.string   "url"
    t.text     "address"
  end

  create_table "deals", :force => true do |t|
    t.integer  "d_meal_id"
    t.integer  "d_restaurant_id"
    t.integer  "threshold"
    t.integer  "range"
    t.integer  "owner_id"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", :force => true do |t|
    t.integer  "order_id"
    t.integer  "service"
    t.integer  "food"
    t.integer  "courtesy"
    t.integer  "cleanliness"
    t.integer  "value_for_money"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "cluster_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.string   "phone"
    t.string   "address_tagged_as"
    t.boolean  "primary_address"
    t.integer  "po"
  end

  create_table "meal_deal_offers", :force => true do |t|
    t.datetime "date"
    t.integer  "res_id"
    t.integer  "quantity"
    t.integer  "target"
    t.integer  "cuisine_id"
    t.integer  "status"
    t.integer  "meal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meals", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "restaurant_id"
    t.boolean  "fp_vegetarian"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "cuisine_id"
    t.boolean  "vegetarian"
    t.text     "meal_info"
    t.float    "price"
  end

  create_table "meals_comments", :force => true do |t|
    t.integer  "meal_id"
    t.text     "commented_data"
    t.string   "deal_name"
    t.text     "description"
    t.string   "meal_info"
    t.string   "deal_tag"
    t.string   "nutr_calories"
    t.string   "nutr_fats"
    t.string   "nutr_cholestrol"
    t.string   "nutr_sodium"
    t.string   "nutr_carbs"
    t.string   "nutr_protein"
    t.string   "reject_by_admin_id"
    t.string   "picture_file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offers", :force => true do |t|
    t.integer  "deal_id"
    t.integer  "maximum_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status"
    t.integer  "yday"
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "offer_id"
    t.integer  "status"
    t.integer  "amount"
    t.text     "extra_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "owners", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "request_locations", :force => true do |t|
    t.string   "r_name"
    t.string   "r_email"
    t.string   "r_location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurant_sches", :force => true do |t|
    t.integer  "res_id"
    t.integer  "quantity"
    t.integer  "dish_id"
    t.integer  "status"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "lat"
    t.float    "lng"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
    t.integer  "status"
    t.integer  "cuisine_id"
    t.integer  "cluster_id"
    t.string   "phone"
    t.string   "url"
    t.text     "address"
    t.string   "your_name"
    t.integer  "owner_id"
    t.string   "email"
    t.string   "address2"
    t.string   "zip_code"
    t.string   "website"
    t.string   "delivery_name"
    t.string   "delivery_staff"
    t.string   "order_day"
    t.string   "primary_cusine"
    t.boolean  "combo_meals"
    t.string   "owner_name"
    t.boolean  "home_delivery"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales_enquiries", :force => true do |t|
    t.string   "name"
    t.string   "your_name"
    t.string   "owner_name"
    t.string   "email"
    t.string   "address1"
    t.string   "address2"
    t.integer  "zip_code"
    t.string   "phone"
    t.string   "website"
    t.string   "delivery_staff"
    t.string   "order_day"
    t.boolean  "combo_meals"
    t.string   "primary_cuisine"
    t.string   "home_delivery"
    t.integer  "admin_id"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "targets", :force => true do |t|
    t.integer  "amount"
    t.integer  "yday"
    t.integer  "cuisine_id"
    t.integer  "cluster_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "frozen"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "hash"
    t.string   "pwreset"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "fp_vegetarian"
    t.boolean  "fp_vegan"
    t.boolean  "fp_glutenfree"
    t.float    "lat"
    t.float    "lng"
    t.integer  "cluster_id"
    t.integer  "points"
    t.integer  "current_location"
    t.text     "phone"
    t.string   "cuisines"
    t.integer  "po"
    t.string   "address"
    t.boolean  "is_veg",           :default => false
    t.string   "street"
    t.string   "zipcode"
  end

end
