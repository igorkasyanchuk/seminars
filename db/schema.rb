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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120207191101) do

  create_table "advisor_practice_areas", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "advisor_practice_areas", ["name"], :name => "index_advisor_practice_areas_on_name"

  create_table "advisor_practice_areas_advisors", :id => false, :force => true do |t|
    t.integer "advisor_practice_area_id"
    t.integer "advisor_id"
  end

  add_index "advisor_practice_areas_advisors", ["advisor_id"], :name => "index_advisor_practice_areas_advisors_on_advisor_id"
  add_index "advisor_practice_areas_advisors", ["advisor_practice_area_id"], :name => "aaapa_pa_id"

  create_table "advisors", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "firm"
    t.string   "title"
    t.string   "web_site"
    t.text     "description"
    t.string   "address"
    t.string   "blog"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.string   "contact_im"
    t.string   "contact_skype"
    t.text     "contact_bio"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "country"
    t.string   "zip"
    t.string   "city"
    t.string   "linked_in"
    t.string   "twitter"
    t.string   "facebook"
    t.integer  "state_id"
    t.integer  "rating_order",                                       :default => 0
    t.integer  "accuracy",                                           :default => -1
    t.decimal  "lat",                :precision => 15, :scale => 10, :default => 0.0
    t.decimal  "lng",                :precision => 15, :scale => 10, :default => 0.0
    t.string   "contact_email_2"
    t.string   "contact_email_3"
    t.string   "contact_email_4"
    t.string   "contact_email_5"
  end

  add_index "advisors", ["user_id"], :name => "index_advisors_on_user_id"

  create_table "advisors_languages", :id => false, :force => true do |t|
    t.integer "advisor_id"
    t.integer "language_id"
  end

  add_index "advisors_languages", ["advisor_id"], :name => "index_advisors_languages_on_advisor_id"
  add_index "advisors_languages", ["language_id"], :name => "index_advisors_languages_on_language_id"

  create_table "asset_photos", :force => true do |t|
    t.datetime "created_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "assets", :force => true do |t|
    t.datetime "created_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "attachments", :force => true do |t|
    t.string   "title"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.string   "attachment_file_size"
    t.integer  "document_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attorneys", :force => true do |t|
    t.string   "name"
    t.string   "firm"
    t.string   "web_site"
    t.text     "description"
    t.string   "address"
    t.string   "blog"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.string   "contact_im"
    t.string   "contact_skype"
    t.text     "contact_bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "title"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "country"
    t.string   "zip"
    t.string   "city"
    t.string   "linked_in"
    t.string   "twitter"
    t.string   "facebook"
    t.integer  "state_id"
    t.integer  "rating_order",                                       :default => 0
    t.integer  "accuracy",                                           :default => -1
    t.decimal  "lat",                :precision => 15, :scale => 10, :default => 0.0
    t.decimal  "lng",                :precision => 15, :scale => 10, :default => 0.0
    t.string   "contact_email_2"
    t.string   "contact_email_3"
    t.string   "contact_email_4"
    t.string   "contact_email_5"
  end

  create_table "attorneys_languages", :id => false, :force => true do |t|
    t.integer "attorney_id"
    t.integer "language_id"
  end

  add_index "attorneys_languages", ["attorney_id"], :name => "index_attorneys_languages_on_attorney_id"
  add_index "attorneys_languages", ["language_id"], :name => "index_attorneys_languages_on_language_id"

  create_table "attorneys_practice_areas", :id => false, :force => true do |t|
    t.integer "attorney_id"
    t.integer "practice_area_id"
  end

  add_index "attorneys_practice_areas", ["attorney_id"], :name => "index_attorneys_practice_areas_on_attorney_id"
  add_index "attorneys_practice_areas", ["practice_area_id"], :name => "index_attorneys_practice_areas_on_practice_area_id"

  create_table "cities", :force => true do |t|
    t.string  "name"
    t.text    "description"
    t.string  "country"
    t.boolean "for_home_page",      :default => true
    t.string  "photo_file_name"
    t.string  "photo_content_type"
    t.integer "photo_file_size"
    t.integer "photo_updated_at"
  end

  create_table "documents", :force => true do |t|
    t.integer "seminar_id"
    t.string  "title"
    t.text    "description"
  end

  add_index "documents", ["seminar_id"], :name => "index_documents_on_seminar_id"

  create_table "firm_practice_areas", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "firm_practice_areas", ["name"], :name => "index_firm_practice_areas_on_name"

  create_table "firm_practice_areas_firms", :id => false, :force => true do |t|
    t.integer "firm_practice_area_id"
    t.integer "firm_id"
  end

  add_index "firm_practice_areas_firms", ["firm_id"], :name => "index_firm_practice_areas_firms_on_firm_id"
  add_index "firm_practice_areas_firms", ["firm_practice_area_id"], :name => "firm_pa_id"

  create_table "firms", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "firm"
    t.string   "title"
    t.string   "web_site"
    t.text     "description"
    t.string   "address"
    t.string   "blog"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.string   "contact_im"
    t.string   "contact_skype"
    t.text     "contact_bio"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "country"
    t.string   "zip"
    t.string   "city"
    t.string   "linked_in"
    t.string   "twitter"
    t.string   "facebook"
    t.integer  "state_id"
    t.text     "short_description"
    t.integer  "rating_order",                                       :default => 0
    t.integer  "accuracy",                                           :default => -1
    t.decimal  "lat",                :precision => 15, :scale => 10, :default => 0.0
    t.decimal  "lng",                :precision => 15, :scale => 10, :default => 0.0
    t.string   "contact_email_2"
    t.string   "contact_email_3"
    t.string   "contact_email_4"
    t.string   "contact_email_5"
  end

  add_index "firms", ["state_id"], :name => "index_firms_on_state_id"

  create_table "firms_languages", :id => false, :force => true do |t|
    t.integer "firm_id"
    t.integer "language_id"
  end

  add_index "firms_languages", ["firm_id"], :name => "index_firms_languages_on_firm_id"
  add_index "firms_languages", ["language_id"], :name => "index_firms_languages_on_language_id"

  create_table "languages", :force => true do |t|
    t.string "name"
  end

  create_table "languages_service_providers", :id => false, :force => true do |t|
    t.integer "language_id"
    t.integer "service_provider_id"
  end

  add_index "languages_service_providers", ["language_id"], :name => "index_languages_service_providers_on_language_id"
  add_index "languages_service_providers", ["service_provider_id"], :name => "index_languages_service_providers_on_service_provider_id"

  create_table "languages_sponsors", :id => false, :force => true do |t|
    t.integer "language_id"
    t.integer "sponsor_id"
  end

  create_table "page_blocks", :force => true do |t|
    t.string "identifier"
    t.text   "content"
  end

  add_index "page_blocks", ["identifier"], :name => "index_page_blocks_on_identifier"

  create_table "pages", :force => true do |t|
    t.string "identifier"
    t.string "page_title"
    t.text   "content"
    t.string "seo_title"
    t.string "seo_description"
    t.string "seo_keywords"
  end

  add_index "pages", ["identifier"], :name => "index_pages_on_identifier"

  create_table "panels", :force => true do |t|
    t.integer "seminar_id"
    t.string  "title"
    t.text    "description"
    t.string  "logo_file_name"
    t.string  "logo_content_type"
    t.integer "logo_file_size"
  end

  add_index "panels", ["seminar_id"], :name => "index_panels_on_seminar_id"

  create_table "panels_speakers", :id => false, :force => true do |t|
    t.integer "panel_id"
    t.integer "speaker_id"
  end

  create_table "panels_sponsors", :id => false, :force => true do |t|
    t.integer "panel_id"
    t.integer "sponsor_id"
  end

  create_table "practice_areas", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "practice_areas_sponsors", :id => false, :force => true do |t|
    t.integer "practice_area_id"
    t.integer "sponsor_id"
  end

  create_table "seminars", :force => true do |t|
    t.integer "city_id"
    t.string  "title"
    t.text    "agenda"
    t.date    "start_on"
    t.date    "ends_on"
    t.text    "price_full_information"
    t.string  "price_short_information"
    t.string  "photo_file_name"
    t.string  "photo_content_type"
    t.integer "photo_file_size"
    t.integer "photo_updated_at"
    t.text    "tickets_html"
  end

  add_index "seminars", ["city_id"], :name => "index_seminars_on_city_id"

  create_table "seminars_speakers", :id => false, :force => true do |t|
    t.integer "seminar_id"
    t.integer "speaker_id"
  end

  create_table "seminars_sponsors", :id => false, :force => true do |t|
    t.integer "seminar_id"
    t.integer "sponsor_id"
  end

  create_table "service_provider_practice_areas", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_provider_practice_areas_service_providers", :id => false, :force => true do |t|
    t.integer "service_provider_practice_area_id"
    t.integer "service_provider_id"
  end

  add_index "service_provider_practice_areas_service_providers", ["service_provider_id"], :name => "sppasp_spid"
  add_index "service_provider_practice_areas_service_providers", ["service_provider_practice_area_id"], :name => "sppasp_paid"

  create_table "service_providers", :force => true do |t|
    t.string   "name"
    t.string   "firm"
    t.string   "web_site"
    t.text     "description"
    t.string   "address"
    t.string   "blog"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.string   "contact_im"
    t.string   "contact_skype"
    t.text     "contact_bio"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "title"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "country"
    t.string   "zip"
    t.string   "city"
    t.string   "linked_in"
    t.string   "twitter"
    t.string   "facebook"
    t.integer  "state_id"
    t.integer  "rating_order",                                       :default => 0
    t.integer  "accuracy",                                           :default => -1
    t.decimal  "lat",                :precision => 15, :scale => 10, :default => 0.0
    t.decimal  "lng",                :precision => 15, :scale => 10, :default => 0.0
    t.string   "contact_email_2"
    t.string   "contact_email_3"
    t.string   "contact_email_4"
    t.string   "contact_email_5"
  end

  add_index "service_providers", ["user_id"], :name => "index_service_providers_on_user_id"

  create_table "speakers", :force => true do |t|
    t.string  "name"
    t.string  "position"
    t.text    "about"
    t.string  "email"
    t.string  "website"
    t.integer "priority",           :default => 0
    t.string  "photo_file_name"
    t.string  "photo_content_type"
    t.integer "photo_file_size"
    t.string  "owner_type"
    t.integer "owner_id"
    t.string  "firm"
    t.string  "contact_phone"
    t.string  "skype"
    t.string  "country"
    t.string  "address"
    t.string  "city"
    t.string  "zip"
    t.string  "linked_in"
    t.string  "twitter"
    t.string  "facebook"
  end

  create_table "speakers_languages", :id => false, :force => true do |t|
    t.integer "speaker_id"
    t.integer "language_id"
  end

  create_table "speakers_practice_areas", :id => false, :force => true do |t|
    t.integer "speaker_id"
    t.integer "practice_area_id"
  end

  create_table "sponsors", :force => true do |t|
    t.string  "name"
    t.text    "description"
    t.string  "website"
    t.string  "email"
    t.integer "priority",          :default => 0
    t.string  "logo_file_name"
    t.string  "logo_content_type"
    t.integer "logo_file_size"
    t.string  "owner_type"
    t.integer "owner_id"
    t.string  "firm"
    t.string  "contact_phone"
    t.string  "skype"
    t.string  "country"
    t.string  "address"
    t.string  "city"
    t.string  "zip"
    t.string  "linked_in"
    t.string  "twitter"
    t.string  "facebook"
  end

end
