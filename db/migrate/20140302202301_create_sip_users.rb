class CreateSipUsers < ActiveRecord::Migration
  def change
    create_table :sip_users do |t|
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
  end
end
