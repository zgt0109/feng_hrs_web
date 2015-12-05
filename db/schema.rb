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

ActiveRecord::Schema.define(version: 20151205080735) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true, using: :btree
  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  add_index "admins", ["unlock_token"], name: "index_admins_on_unlock_token", unique: true, using: :btree

  create_table "appointments", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "labor_id"
    t.integer  "zhao_id"
    t.integer  "song_id"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "appointments", ["job_id"], name: "index_appointments_on_job_id", using: :btree
  add_index "appointments", ["labor_id"], name: "index_appointments_on_labor_id", using: :btree
  add_index "appointments", ["song_id"], name: "index_appointments_on_song_id", using: :btree
  add_index "appointments", ["state"], name: "index_appointments_on_state", using: :btree
  add_index "appointments", ["zhao_id"], name: "index_appointments_on_zhao_id", using: :btree

  create_table "banks", force: :cascade do |t|
    t.string   "name"
    t.datetime "published_at"
    t.datetime "deleted_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "companies", force: :cascade do |t|
    t.integer  "enterprise_id"
    t.string   "name"
    t.string   "province"
    t.string   "city"
    t.string   "district"
    t.string   "address"
    t.text     "introduction"
    t.datetime "deleted_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "companies", ["city"], name: "index_companies_on_city", using: :btree
  add_index "companies", ["deleted_at"], name: "index_companies_on_deleted_at", using: :btree
  add_index "companies", ["district"], name: "index_companies_on_district", using: :btree
  add_index "companies", ["enterprise_id"], name: "index_companies_on_enterprise_id", using: :btree
  add_index "companies", ["name"], name: "index_companies_on_name", using: :btree
  add_index "companies", ["province"], name: "index_companies_on_province", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.integer  "enterprise_id"
    t.string   "name"
    t.string   "mobile"
    t.string   "gender"
    t.datetime "deleted_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "contacts", ["deleted_at"], name: "index_contacts_on_deleted_at", using: :btree
  add_index "contacts", ["enterprise_id"], name: "index_contacts_on_enterprise_id", using: :btree
  add_index "contacts", ["gender"], name: "index_contacts_on_gender", using: :btree
  add_index "contacts", ["mobile"], name: "index_contacts_on_mobile", using: :btree
  add_index "contacts", ["name"], name: "index_contacts_on_name", using: :btree

  create_table "debits", force: :cascade do |t|
    t.integer  "enterprise_id"
    t.integer  "bank_id"
    t.string   "name"
    t.string   "account"
    t.string   "deposit"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "debits", ["account"], name: "index_debits_on_account", using: :btree
  add_index "debits", ["bank_id"], name: "index_debits_on_bank_id", using: :btree
  add_index "debits", ["enterprise_id"], name: "index_debits_on_enterprise_id", using: :btree
  add_index "debits", ["name"], name: "index_debits_on_name", using: :btree

  create_table "enterprises", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "mobile"
  end

  add_index "enterprises", ["confirmation_token"], name: "index_enterprises_on_confirmation_token", unique: true, using: :btree
  add_index "enterprises", ["email"], name: "index_enterprises_on_email", unique: true, using: :btree
  add_index "enterprises", ["reset_password_token"], name: "index_enterprises_on_reset_password_token", unique: true, using: :btree
  add_index "enterprises", ["unlock_token"], name: "index_enterprises_on_unlock_token", unique: true, using: :btree

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

  create_table "industries", force: :cascade do |t|
    t.string   "name"
    t.string   "name_seo"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "industries", ["deleted_at"], name: "index_industries_on_deleted_at", using: :btree
  add_index "industries", ["lft"], name: "index_industries_on_lft", using: :btree
  add_index "industries", ["name"], name: "index_industries_on_name", using: :btree
  add_index "industries", ["name_seo"], name: "index_industries_on_name_seo", using: :btree
  add_index "industries", ["parent_id"], name: "index_industries_on_parent_id", using: :btree
  add_index "industries", ["rgt"], name: "index_industries_on_rgt", using: :btree

  create_table "intentions_positions", id: false, force: :cascade do |t|
    t.integer "intention_id", null: false
    t.integer "position_id",  null: false
  end

  add_index "intentions_positions", ["intention_id", "position_id"], name: "index_intentions_positions_on_intention_id_and_position_id", using: :btree
  add_index "intentions_positions", ["position_id", "intention_id"], name: "index_intentions_positions_on_position_id_and_intention_id", using: :btree

  create_table "job_commission_days", force: :cascade do |t|
    t.integer  "job_id"
    t.string   "gender"
    t.integer  "deadline"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "job_commission_days", ["job_id"], name: "index_job_commission_days_on_job_id", using: :btree

  create_table "job_commission_people", force: :cascade do |t|
    t.integer  "job_id"
    t.string   "gender"
    t.integer  "amount"
    t.string   "unit"
    t.integer  "deadline"
    t.integer  "check"
    t.integer  "remit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "job_commission_people", ["job_id"], name: "index_job_commission_people_on_job_id", using: :btree

  create_table "job_quantities", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "wish_male_count"
    t.integer  "wish_female_count"
    t.integer  "wish_unkown_count"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "job_quantities", ["job_id"], name: "index_job_quantities_on_job_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.integer  "enterprise_id"
    t.integer  "company_id"
    t.integer  "contact_id"
    t.string   "name"
    t.integer  "wage"
    t.string   "unit"
    t.integer  "worktime"
    t.integer  "royalty"
    t.integer  "bonus"
    t.string   "channel"
    t.integer  "wageday"
    t.string   "wageday_unit"
    t.integer  "advance"
    t.datetime "deleted_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "jobs", ["company_id"], name: "index_jobs_on_company_id", using: :btree
  add_index "jobs", ["contact_id"], name: "index_jobs_on_contact_id", using: :btree
  add_index "jobs", ["enterprise_id"], name: "index_jobs_on_enterprise_id", using: :btree

  create_table "labor_intentions", force: :cascade do |t|
    t.integer  "labor_id"
    t.string   "salary"
    t.string   "province"
    t.string   "city"
    t.string   "district"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "labor_intentions", ["city"], name: "index_labor_intentions_on_city", using: :btree
  add_index "labor_intentions", ["district"], name: "index_labor_intentions_on_district", using: :btree
  add_index "labor_intentions", ["labor_id"], name: "index_labor_intentions_on_labor_id", using: :btree
  add_index "labor_intentions", ["province"], name: "index_labor_intentions_on_province", using: :btree
  add_index "labor_intentions", ["salary"], name: "index_labor_intentions_on_salary", using: :btree

  create_table "labors", force: :cascade do |t|
    t.integer  "enterprise_id"
    t.string   "name"
    t.string   "mobile"
    t.string   "idcard"
    t.string   "gender"
    t.date     "birthday"
    t.string   "channel"
    t.string   "province"
    t.string   "city"
    t.string   "district"
    t.string   "state"
    t.datetime "deleted_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "labors", ["birthday"], name: "index_labors_on_birthday", using: :btree
  add_index "labors", ["channel"], name: "index_labors_on_channel", using: :btree
  add_index "labors", ["city"], name: "index_labors_on_city", using: :btree
  add_index "labors", ["deleted_at"], name: "index_labors_on_deleted_at", using: :btree
  add_index "labors", ["district"], name: "index_labors_on_district", using: :btree
  add_index "labors", ["enterprise_id"], name: "index_labors_on_enterprise_id", using: :btree
  add_index "labors", ["gender"], name: "index_labors_on_gender", using: :btree
  add_index "labors", ["idcard"], name: "index_labors_on_idcard", using: :btree
  add_index "labors", ["mobile"], name: "index_labors_on_mobile", using: :btree
  add_index "labors", ["name"], name: "index_labors_on_name", using: :btree
  add_index "labors", ["province"], name: "index_labors_on_province", using: :btree
  add_index "labors", ["state"], name: "index_labors_on_state", using: :btree

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.string   "domain"
    t.string   "uri"
    t.string   "icon"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pages", ["slug"], name: "index_pages_on_slug", unique: true, using: :btree

  create_table "positions", force: :cascade do |t|
    t.string   "name"
    t.string   "name_seo"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "positions", ["deleted_at"], name: "index_positions_on_deleted_at", using: :btree
  add_index "positions", ["lft"], name: "index_positions_on_lft", using: :btree
  add_index "positions", ["name"], name: "index_positions_on_name", using: :btree
  add_index "positions", ["name_seo"], name: "index_positions_on_name_seo", using: :btree
  add_index "positions", ["parent_id"], name: "index_positions_on_parent_id", using: :btree
  add_index "positions", ["rgt"], name: "index_positions_on_rgt", using: :btree

  add_foreign_key "appointments", "jobs"
  add_foreign_key "appointments", "labors"
  add_foreign_key "companies", "enterprises"
  add_foreign_key "contacts", "enterprises"
  add_foreign_key "debits", "banks"
  add_foreign_key "debits", "enterprises"
  add_foreign_key "job_commission_days", "jobs"
  add_foreign_key "job_commission_people", "jobs"
  add_foreign_key "job_quantities", "jobs"
  add_foreign_key "jobs", "companies"
  add_foreign_key "jobs", "contacts"
  add_foreign_key "jobs", "enterprises"
  add_foreign_key "labor_intentions", "labors"
  add_foreign_key "labors", "enterprises"
end
