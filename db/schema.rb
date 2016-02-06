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

ActiveRecord::Schema.define(version: 20151124192520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "pan"
    t.string   "address"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.boolean  "is_verified"
    t.string   "password_digest"
    t.string   "activation_digest"
    t.string   "remember_digest"
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "industries", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "job_statuses", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "industry_id"
    t.integer  "location_id"
    t.string   "title"
    t.string   "job_description"
    t.string   "postal_code"
    t.string   "salary_type"
    t.integer  "salary_offered"
    t.string   "contact_person_name"
    t.string   "contact_person_phone"
    t.string   "contact_person_email"
    t.boolean  "is_online"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "qualifications", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "questionnaire_options", force: :cascade do |t|
    t.integer  "questionnaire_id"
    t.string   "option"
    t.boolean  "isRight"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "questionnaire_results", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.integer  "score"
    t.boolean  "passed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questionnaire_results", ["job_id"], name: "index_questionnaire_results_on_job_id", using: :btree
  add_index "questionnaire_results", ["user_id"], name: "index_questionnaire_results_on_user_id", using: :btree

  create_table "questionnaires", force: :cascade do |t|
    t.integer  "job_id"
    t.string   "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salary_ranges", force: :cascade do |t|
    t.integer  "min_amount"
    t.integer  "max_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "saved_applied_jobs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.integer  "job_status_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "saved_applied_jobs", ["job_id"], name: "index_saved_applied_jobs_on_job_id", using: :btree
  add_index "saved_applied_jobs", ["job_status_id"], name: "index_saved_applied_jobs_on_job_status_id", using: :btree
  add_index "saved_applied_jobs", ["user_id"], name: "index_saved_applied_jobs_on_user_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_languages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "language_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_languages", ["language_id"], name: "index_user_languages_on_language_id", using: :btree
  add_index "user_languages", ["user_id"], name: "index_user_languages_on_user_id", using: :btree

  create_table "user_skills", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_skills", ["skill_id"], name: "index_user_skills_on_skill_id", using: :btree
  add_index "user_skills", ["user_id"], name: "index_user_skills_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "qualification_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "password_digest"
    t.string   "activation_digest"
    t.string   "remember_digest"
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_foreign_key "saved_applied_jobs", "job_statuses"
  add_foreign_key "saved_applied_jobs", "jobs"
  add_foreign_key "saved_applied_jobs", "users"
end
