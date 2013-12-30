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

ActiveRecord::Schema.define(version: 20131118115412) do

  create_table "cdr", primary_key: "cdr_pkey", force: true do |t|
    t.datetime "calldate",                           null: false
    t.text     "clid",                  default: "", null: false
    t.text     "src",                   default: "", null: false
    t.text     "dst",                   default: "", null: false
    t.text     "dcontext",              default: "", null: false
    t.text     "channel",               default: "", null: false
    t.text     "dstchannel",            default: "", null: false
    t.text     "lastapp",               default: "", null: false
    t.text     "lastdata",              default: "", null: false
    t.integer  "duration",    limit: 8, default: 0,  null: false
    t.integer  "billsec",     limit: 8, default: 0,  null: false
    t.text     "disposition",           default: "", null: false
    t.integer  "amaflags",    limit: 8, default: 0,  null: false
    t.text     "accountcode",           default: "", null: false
    t.text     "uniqueid",              default: "", null: false
    t.text     "userfield",             default: "", null: false
  end

  create_table "cities", force: true do |t|
    t.string   "number"
    t.integer  "channels"
    t.text     "file"
    t.boolean  "autoanswer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "functions", force: true do |t|
    t.text     "title"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "surname"
    t.string   "firstname"
    t.string   "patronymic"
    t.integer  "sip_user_id"
    t.integer  "subdivision_id"
    t.integer  "function_id"
    t.integer  "city_id"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people_subdivisions", id: false, force: true do |t|
    t.integer "person_id"
    t.integer "subdivision_id"
  end

  create_table "positions", force: true do |t|
    t.integer  "person_id"
    t.integer  "subdivision_id"
    t.integer  "function_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sip_users", force: true do |t|
    t.string  "name",           limit: 80,                          null: false
    t.string  "host",           limit: 31,  default: "dynamic",     null: false
    t.string  "nat",            limit: 5,   default: "yes",         null: false
    t.text    "ntype",                      default: "friend",      null: false
    t.string  "accountcode",    limit: 20
    t.string  "amaflags",       limit: 13
    t.string  "callgroup",      limit: 10,  default: "1",           null: false
    t.string  "callerid",       limit: 80,                          null: false
    t.string  "cancallforward", limit: 3,   default: "yes"
    t.string  "canreinvite",    limit: 3,   default: "yes"
    t.string  "context",        limit: 80,  default: "msiu",        null: false
    t.string  "defaultip",      limit: 15
    t.string  "dtmfmode",       limit: 7
    t.string  "fromuser",       limit: 80
    t.string  "fromdomain",     limit: 80
    t.string  "insecure",       limit: 4
    t.string  "language",       limit: 2
    t.string  "mailbox",        limit: 50,  default: "none",        null: false
    t.string  "md5secret",      limit: 80
    t.string  "deny",           limit: 95
    t.string  "permit",         limit: 95
    t.string  "mask",           limit: 95
    t.string  "musiconhold",    limit: 100
    t.string  "pickupgroup",    limit: 10
    t.string  "qualify",        limit: 3
    t.string  "regexten",       limit: 80
    t.string  "restrictcid",    limit: 3
    t.string  "rtptimeout",     limit: 3
    t.string  "rtpholdtimeout", limit: 3
    t.string  "secret",         limit: 80,  default: "x79zfpjjb",   null: false
    t.string  "setvar",         limit: 100
    t.string  "disallow",       limit: 100, default: "all"
    t.string  "allow",          limit: 100, default: "alaw:2,g729"
    t.string  "fullcontact",    limit: 80,  default: "",            null: false
    t.string  "ipaddr",         limit: 15
    t.integer "port"
    t.string  "regserver",      limit: 100
    t.integer "regseconds",                 default: 0,             null: false
    t.string  "username",       limit: 80,                          null: false
    t.string  "lasms",          limit: 20,  default: ""
    t.text    "podrazdelenie"
    t.string  "rus_name",       limit: nil
    t.text    "zvanie"
    t.boolean "allow_city_in",              default: false,         null: false
    t.boolean "allow_city_out",             default: false,         null: false
    t.text    "telephon_type"
    t.text    "full_name"
    t.integer "prio_zv"
    t.integer "prio_podr"
    t.boolean "vip",                        default: false,         null: false
  end

  add_index "sip_users", ["name", "host"], name: "sip_users_idx", using: :btree

  create_table "subdivisions", force: true do |t|
    t.text     "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subdivisions", ["title"], name: "index_subdivisions_on_title", using: :btree

end
