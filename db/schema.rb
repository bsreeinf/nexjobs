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

ActiveRecord::Schema.define(version: 20151122203040) do

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "pan"
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

  add_index "questionnaire_results", ["job_id"], name: "index_questionnaire_results_on_job_id"
  add_index "questionnaire_results", ["user_id"], name: "index_questionnaire_results_on_user_id"

  create_table "questionnaires", force: :cascade do |t|
    t.integer  "job_id"
    t.string   "quesetion"
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
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "saved_applied_jobs", ["job_id"], name: "index_saved_applied_jobs_on_job_id"
  add_index "saved_applied_jobs", ["user_id"], name: "index_saved_applied_jobs_on_user_id"

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

  add_index "user_languages", ["language_id"], name: "index_user_languages_on_language_id"
  add_index "user_languages", ["user_id"], name: "index_user_languages_on_user_id"

  create_table "user_qualifications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "qualification_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "user_qualifications", ["qualification_id"], name: "index_user_qualifications_on_qualification_id"
  add_index "user_qualifications", ["user_id"], name: "index_user_qualifications_on_user_id"

  create_table "user_skills", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_skills", ["skill_id"], name: "index_user_skills_on_skill_id"
  add_index "user_skills", ["user_id"], name: "index_user_skills_on_user_id"

  create_table "users", force: :cascade do |t|
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

end
