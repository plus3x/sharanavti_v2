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

ActiveRecord::Schema.define(version: 20140116082847) do

  create_table "posts", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "picture_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "yandex_moneys", force: true do |t|
    t.datetime "requestDatetime"
    t.string   "action"
    t.integer  "shopId"
    t.integer  "shopArticleId"
    t.string   "invoiceId"
    t.string   "customerNumber"
    t.datetime "orderCreatedDatetime"
    t.float    "orderSumAmount"
    t.float    "orderSumCurrencyPaycash"
    t.float    "orderSumBankPaycash"
    t.float    "shopSumAmount"
    t.float    "shopSumCurrencyPaycash"
    t.float    "shopSumBankPaycash"
    t.datetime "paymentDatetime"
    t.string   "paymentPayerCode"
    t.integer  "user_id"
    t.integer  "gemSum"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
