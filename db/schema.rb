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

ActiveRecord::Schema.define(:version => 20110619201757) do

  create_table "appointments", :force => true do |t|
    t.integer  "patient_id"
    t.integer  "doctor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "history"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
  end

  add_index "categories", ["ancestry"], :name => "index_categories_on_ancestry"

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "doctors", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "email"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "birth_date"
    t.string   "photo"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "service_id"
    t.integer  "appointment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",       :default => 1
  end

  create_table "patients", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "title"
    t.date     "birth_date"
    t.string   "address"
    t.string   "phone_number"
    t.string   "hepatitis"
    t.string   "tuberculosis"
    t.string   "occlusion"
    t.string   "allergy"
    t.string   "oncology"
    t.string   "mucosa"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "full_name"
    t.string   "profile"
    t.boolean  "remind_for_birthday"
    t.boolean  "remind_for_inspection"
  end

  create_table "services", :force => true do |t|
    t.text     "name"
    t.float    "price"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teeth_charts", :force => true do |t|
    t.string   "tooth_11"
    t.string   "tooth_12"
    t.string   "tooth_13"
    t.string   "tooth_14"
    t.string   "tooth_15"
    t.string   "tooth_16"
    t.string   "tooth_17"
    t.string   "tooth_18"
    t.string   "tooth_21"
    t.string   "tooth_22"
    t.string   "tooth_23"
    t.string   "tooth_24"
    t.string   "tooth_25"
    t.string   "tooth_26"
    t.string   "tooth_27"
    t.string   "tooth_28"
    t.string   "tooth_31"
    t.string   "tooth_32"
    t.string   "tooth_33"
    t.string   "tooth_34"
    t.string   "tooth_35"
    t.string   "tooth_36"
    t.string   "tooth_37"
    t.string   "tooth_38"
    t.string   "tooth_41"
    t.string   "tooth_42"
    t.string   "tooth_43"
    t.string   "tooth_44"
    t.string   "tooth_45"
    t.string   "tooth_46"
    t.string   "tooth_47"
    t.string   "tooth_48"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "patient_id"
  end

  create_table "templates", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
