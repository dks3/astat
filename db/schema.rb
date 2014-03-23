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

ActiveRecord::Schema.define(version: 20140316233938) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: true do |t|
    t.string   "number",                           null: false
    t.integer  "channels",   limit: 2, default: 1, null: false
    t.text     "file"
    t.boolean  "autoanswer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "codes", force: true do |t|
    t.integer  "tariff_id"
    t.integer  "city_code"
    t.integer  "country_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "functions", force: true do |t|
    t.text     "title",      null: false
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "surname",                        null: false
    t.string   "firstname",                      null: false
    t.string   "patronymic"
    t.integer  "sip_user_id"
    t.integer  "subdivision_id"
    t.integer  "function_id"
    t.integer  "city_id"
    t.boolean  "status",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string  "rus_name"
    t.text    "zvanie"
    t.boolean "allow_city_in",              default: false,         null: false
    t.boolean "allow_city_out",             default: false,         null: false
    t.text    "telephon_type"
    t.text    "full_name"
    t.integer "prio_zv"
    t.integer "prio_podr"
    t.boolean "vip",                        default: false,         null: false
  end

  create_table "subdivisions", force: true do |t|
    t.text     "title",          null: false
    t.integer  "subdivision_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tariffs", force: true do |t|
    t.string   "title"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
