# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_04_064835) do
  create_table "accounts", force: :cascade do |t|
    t.integer "user_id"
    t.string "coin"
    t.string "refer_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "app_opens", force: :cascade do |t|
    t.integer "user_id"
    t.string "versionName"
    t.string "versionCode"
    t.string "location"
    t.string "source_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "earns", force: :cascade do |t|
    t.integer "account_id"
    t.integer "reward_id"
    t.string "logo"
    t.string "name"
    t.integer "coin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fantasies", force: :cascade do |t|
    t.string "title"
    t.string "logo"
    t.string "link"
    t.string "refrelCode"
    t.string "signUpBonus"
    t.string "Withdraw"
    t.string "withdrawType"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.string "views"
    t.string "matchStatus"
    t.string "frontTeam"
    t.string "oppTeam"
  end

  create_table "play_earns", force: :cascade do |t|
    t.string "title"
    t.string "blogImage"
    t.string "blogUrl"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "team_id"
    t.string "score"
    t.text "roles"
  end

  create_table "points", force: :cascade do |t|
    t.string "logo"
    t.string "type"
    t.string "coin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rewards", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.string "amount"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "task_offers", force: :cascade do |t|
    t.string "title"
    t.string "titleImg"
    t.string "tasks"
    t.string "text"
    t.string "point"
    t.string "reward"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "termsCondition"
    t.string "steps"
    t.string "link"
  end

  create_table "teams", force: :cascade do |t|
    t.string "teamName"
    t.string "teamCode"
    t.string "teamLogo"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "mobile"
    t.string "birthDate"
    t.string "location"
    t.string "gender"
    t.string "profile_pic"
    t.string "occupation"
    t.string "source_ip"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "deviceId"
    t.string "deviceType"
    t.string "deviceName"
    t.string "securityToken"
    t.string "socialType"
    t.string "socialId"
    t.string "socialToken"
    t.string "socialEmail"
    t.string "socialName"
    t.string "socialmgUrl"
    t.string "advertisingId"
    t.string "versionName"
    t.string "versionCode"
    t.string "utmSource"
    t.string "utmMedium"
    t.string "utmTerm"
    t.string "utmContent"
    t.string "utmCampaign"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "address"
    t.float "latitude"
    t.float "longitude"
    t.float "ip_address"
  end

  create_table "withdraws", force: :cascade do |t|
    t.integer "account_id"
    t.integer "reward_id"
    t.integer "coin"
    t.string "txn_id"
    t.integer "coin_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "user_profiles", "users"
end
