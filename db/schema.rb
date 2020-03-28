# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_28_180508) do

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "address"
    t.string "city"
    t.integer "province_id", null: false
    t.string "username"
    t.string "encrypted_password"
    t.string "salt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["province_id"], name: "index_customers_on_province_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.datetime "order_date"
    t.decimal "total_cost"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "pokemon_orders", force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.integer "order_id", null: false
    t.integer "quantity"
    t.decimal "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_pokemon_orders_on_order_id"
    t.index ["pokemon_id"], name: "index_pokemon_orders_on_pokemon_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.integer "dex_id"
    t.string "name"
    t.string "species"
    t.string "height"
    t.string "weight"
    t.text "description"
    t.decimal "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pokemons_types", id: false, force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.integer "type_id", null: false
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.decimal "pst_rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "customers", "provinces"
  add_foreign_key "orders", "customers"
  add_foreign_key "pokemon_orders", "orders"
  add_foreign_key "pokemon_orders", "pokemons"
end
