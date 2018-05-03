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

ActiveRecord::Schema.define(version: 20180304080655) do

  create_table "achievements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.string "description"
    t.date "achievement_date"
    t.bigint "resume_id"
    t.boolean "is_active", default: true
    t.string "global_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_achievements_on_resume_id"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "description"
    t.boolean "is_active", default: true
    t.string "global_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_certificates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "category_id"
    t.bigint "certificate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categories_certificates_on_category_id"
    t.index ["certificate_id"], name: "index_categories_certificates_on_certificate_id"
  end

  create_table "categories_companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "category_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categories_companies_on_category_id"
    t.index ["company_id"], name: "index_categories_companies_on_company_id"
  end

  create_table "categories_degrees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "category_id"
    t.bigint "degree_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categories_degrees_on_category_id"
    t.index ["degree_id"], name: "index_categories_degrees_on_degree_id"
  end

  create_table "categories_interests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "category_id"
    t.bigint "interest_id"
    t.string "global_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categories_interests_on_category_id"
    t.index ["interest_id"], name: "index_categories_interests_on_interest_id"
  end

  create_table "certificates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.boolean "is_active", default: true
    t.string "global_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "certificates_resumes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "certificate_id"
    t.bigint "resume_id"
    t.date "certificate_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["certificate_id"], name: "index_certificates_resumes_on_certificate_id"
    t.index ["resume_id"], name: "index_certificates_resumes_on_resume_id"
  end

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "country_id"
    t.boolean "is_active", default: true
    t.string "logs", default: ""
    t.string "global_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "description"
    t.boolean "is_active", default: true
    t.string "global_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_companies_on_name"
  end

  create_table "companies_job_titles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "company_id"
    t.bigint "job_title_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_companies_job_titles_on_company_id"
    t.index ["job_title_id"], name: "index_companies_job_titles_on_job_title_id"
  end

  create_table "countries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "country_code"
    t.string "cell_code"
    t.string "logs", default: ""
    t.string "time_zone"
    t.integer "language_id"
    t.boolean "is_active", default: true
    t.string "global_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "degrees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "description"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "degrees_resumes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "degree_id"
    t.bigint "resume_id"
    t.date "degree_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["degree_id"], name: "index_degrees_resumes_on_degree_id"
    t.index ["resume_id"], name: "index_degrees_resumes_on_resume_id"
  end

  create_table "employment_experiences", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "job_title_id"
    t.bigint "company_id"
    t.bigint "resume_id"
    t.date "start_date"
    t.date "end_date"
    t.text "description"
    t.string "global_key"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_employment_experiences_on_company_id"
    t.index ["job_title_id"], name: "index_employment_experiences_on_job_title_id"
    t.index ["resume_id"], name: "index_employment_experiences_on_resume_id"
  end

  create_table "error_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "error_place"
    t.string "error_class"
    t.string "error_message"
    t.text "error_backtrace"
    t.integer "fixed_by"
    t.boolean "is_fixed", default: false
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "image_urls", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "url"
    t.string "fetched_from"
    t.bigint "user_id"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_image_urls_on_user_id"
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.boolean "is_active", default: true
    t.string "logs", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_images_on_user_id"
  end

  create_table "interests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.boolean "is_active", default: true
    t.string "global_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests_resumes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "interest_id"
    t.bigint "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interest_id"], name: "index_interests_resumes_on_interest_id"
    t.index ["resume_id"], name: "index_interests_resumes_on_resume_id"
  end

  create_table "job_titles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "global_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_job_titles_on_name"
  end

  create_table "master_lookups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "key"
    t.string "value"
    t.string "category"
    t.string "code"
    t.string "logs", default: ""
    t.boolean "is_active", default: true
    t.string "global_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category"], name: "index_master_lookups_on_category"
    t.index ["key"], name: "index_master_lookups_on_key"
  end

  create_table "profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.integer "profile_image_id"
    t.string "log"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "resumes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.string "experience"
    t.string "global_key"
    t.bigint "profile_id"
    t.integer "image_id"
    t.string "completion_ratio"
    t.boolean "is_active", default: true
    t.string "resume_designation"
    t.text "objective"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["global_key"], name: "index_resumes_on_global_key"
    t.index ["profile_id"], name: "index_resumes_on_profile_id"
  end

  create_table "resumes_skills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "resume_id"
    t.bigint "skill_id"
    t.integer "rate_skill"
    t.boolean "is_active", default: true
    t.text "activation_logs"
    t.integer "arrangment_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_resumes_skills_on_resume_id"
    t.index ["skill_id"], name: "index_resumes_skills_on_skill_id"
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "access_level"
    t.string "description"
    t.string "logs", default: ""
    t.boolean "is_active", default: true
    t.string "global_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "category_id"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_skills_on_category_id"
  end

  create_table "templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "global_key"
    t.string "description"
    t.bigint "category_id"
    t.boolean "is_active"
    t.text "logs"
    t.string "template_project_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["category_id"], name: "index_templates_on_category_id"
    t.index ["global_key"], name: "index_templates_on_global_key"
  end

  create_table "user_locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "ip_address"
    t.bigint "city_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_user_locations_on_city_id"
    t.index ["user_id"], name: "index_user_locations_on_user_id"
  end

  create_table "user_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "activity"
    t.string "data"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_logs_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "recovery_email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.string "skype"
    t.string "phone"
    t.string "gender"
    t.date "dob"
    t.string "signup_via"
    t.string "address"
    t.string "linked_in"
    t.string "website"
    t.string "github"
    t.string "twitter"
    t.string "blocked_reason"
    t.date "blocked_till"
    t.float "account_balance", limit: 24
    t.integer "allowed_resume"
    t.string "completion_ratio"
    t.string "language_code", default: "en"
    t.bigint "role_id"
    t.bigint "category_id"
    t.bigint "city_id"
    t.string "global_key"
    t.string "logs", default: ""
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_image_file_name"
    t.string "user_image_content_type"
    t.integer "user_image_file_size"
    t.datetime "user_image_updated_at"
    t.index ["category_id"], name: "index_users_on_category_id"
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "achievements", "resumes"
  add_foreign_key "categories_certificates", "categories"
  add_foreign_key "categories_certificates", "certificates"
  add_foreign_key "categories_companies", "categories"
  add_foreign_key "categories_companies", "companies"
  add_foreign_key "categories_degrees", "categories"
  add_foreign_key "categories_degrees", "degrees"
  add_foreign_key "categories_interests", "categories"
  add_foreign_key "categories_interests", "interests"
  add_foreign_key "certificates_resumes", "certificates"
  add_foreign_key "certificates_resumes", "resumes"
  add_foreign_key "cities", "countries"
  add_foreign_key "companies_job_titles", "companies"
  add_foreign_key "companies_job_titles", "job_titles"
  add_foreign_key "degrees_resumes", "degrees"
  add_foreign_key "degrees_resumes", "resumes"
  add_foreign_key "employment_experiences", "companies"
  add_foreign_key "employment_experiences", "job_titles"
  add_foreign_key "employment_experiences", "resumes"
  add_foreign_key "image_urls", "users"
  add_foreign_key "images", "users"
  add_foreign_key "interests_resumes", "interests"
  add_foreign_key "interests_resumes", "resumes"
  add_foreign_key "profiles", "users"
  add_foreign_key "resumes", "profiles"
  add_foreign_key "resumes_skills", "resumes"
  add_foreign_key "resumes_skills", "skills"
  add_foreign_key "skills", "categories"
  add_foreign_key "templates", "categories"
  add_foreign_key "user_locations", "cities"
  add_foreign_key "user_locations", "users"
  add_foreign_key "user_logs", "users"
end
