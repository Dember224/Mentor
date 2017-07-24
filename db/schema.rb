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

ActiveRecord::Schema.define(version: 20170717052754) do

  create_table "careers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "job"
  end

  create_table "messages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "message"
    t.integer "to"
    t.integer "from"
  end

  create_table "pairs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "mentee_id"
    t.string "message"
    t.index ["user_id"], name: "index_pairs_on_user_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "high_school"
    t.integer "hs_class"
    t.string "first_sport"
    t.string "second_sport"
    t.string "third_sport"
    t.string "first_hs_organization"
    t.string "second_hs_organization"
    t.string "undergrad_uni"
    t.string "undergrad_degree_type"
    t.integer "undergrad_class"
    t.string "first_undergrad_major"
    t.string "second_undergrad_major"
    t.string "first_undergrad_minor"
    t.string "second_undergrad_minor"
    t.string "third_undergrad_minor"
    t.string "second_undergrad_uni"
    t.string "second_undergrad_degree_type"
    t.integer "second_undergrad_class"
    t.string "advanced_degree_type"
    t.string "advanced_degree_major"
    t.string "advanced_degree_uni"
    t.integer "advanced_degree_class"
    t.string "second_advanced_degree_type"
    t.string "second_advanced_degree_uni"
    t.string "second_advanced_degree_major"
    t.integer "second_advanced_degree_class"
    t.string "first_campus_organization"
    t.string "second_campus_organization"
    t.string "first_company_name"
    t.string "first_job_title"
    t.date "first_job_start_date"
    t.date "first_job_end_date"
    t.string "second_company_name"
    t.string "second_job_title"
    t.date "second_job_start_date"
    t.date "second_job_end_date"
    t.string "third_company_name"
    t.string "third_job_title"
    t.date "third_job_start_date"
    t.date "third_job_end_date"
    t.string "fourth_company_name"
    t.string "fourth_job_title"
    t.date "fourth_job_start_date"
    t.date "fourth_job_end_date"
    t.string "first_volunteer_organization"
    t.string "second_volunteer_organization"
    t.string "third_volunteer_organization"
    t.string "first_certification"
    t.string "second_certification"
    t.string "third_certification"
    t.string "first_hobby"
    t.string "second_hobby"
    t.string "third_hobby"
    t.index ["user_id"], name: "index_resumes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "email"
    t.string "expertise"
    t.integer "career_id"
    t.text "description"
    t.string "password_digest"
    t.index ["career_id"], name: "index_users_on_career_id"
  end

end
