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

ActiveRecord::Schema.define(version: 20160507164516) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.integer "electorate_id"
    t.string  "name"
    t.date    "dob"
    t.string  "gender"
    t.text    "hometown"
    t.text    "address"
    t.string  "ethnicity"
    t.string  "religion"
    t.string  "general_education"
    t.string  "higher_education"
    t.text    "degrees"
    t.string  "political_studies"
    t.text    "positions"
    t.string  "employer"
    t.date    "party_member_since"
    t.string  "parliment_memberships"
    t.string  "hdnd_memberships"
    t.string  "slug"
    t.text    "facebook_profile_link"
    t.text    "wiki_profile_link"
    t.text    "dbqh_profile_link"
    t.text    "website"
    t.text    "others"
  end

  create_table "electorates", force: :cascade do |t|
    t.integer "province_id"
    t.integer "number"
    t.text    "area"
    t.integer "quota"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "links", force: :cascade do |t|
    t.integer "candidate_id"
    t.text    "url"
    t.integer "clicks_count", default: 0
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
  end

end
