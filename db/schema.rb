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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150719224643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "line_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "quantity"
    t.decimal  "price",      precision: 8, scale: 2, default: 0.0,   null: false
    t.string   "currency",                           default: "MXN"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.integer  "product_id"
  end

  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "number",               limit: 15
    t.decimal  "total",                           precision: 8, scale: 2, default: 0.0, null: false
    t.integer  "state",                                                   default: 0
    t.string   "email"
    t.datetime "completed_at"
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
    t.string   "payment_method_class"
    t.json     "payment_log"
  end

  add_index "orders", ["email"], name: "index_orders_on_email", using: :btree
  add_index "orders", ["number"], name: "index_orders_on_number", unique: true, using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price",       precision: 8, scale: 2, default: 0.0,   null: false
    t.string   "currency",                            default: "MXN", null: false
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_foreign_key "line_items", "orders"
end
