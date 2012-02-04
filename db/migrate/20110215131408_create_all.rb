class CreateAll < ActiveRecord::Migration
  def self.up
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

    create_table "cities", :force => true do |t|
      t.string   "name"
      t.text     "description"
      t.string   "country"
      t.boolean  "for_home_page", :default => true
      t.string   "photo_file_name"
      t.string   "photo_content_type"
      t.integer  "photo_file_size"
      t.integer  "photo_updated_at"
    end

    create_table "seminars", :force => true do |t|
      t.integer  "city_id"
      t.string   "title"
      t.text     "agenda"
      t.date     "start_on"
      t.date     "ends_on"
      t.text     "price_full_information"
      t.string   "price_short_information"
      t.string   "photo_file_name"
      t.string   "photo_content_type"
      t.integer  "photo_file_size"
      t.integer  "photo_updated_at"
    end

    add_index "seminars", "city_id"

    create_table "seminars_speakers", :id => false, :force => true do |t|
      t.integer "seminar_id"
      t.integer "speaker_id"
    end

    create_table "seminars_sponsors", :id => false, :force => true do |t|
      t.integer "seminar_id"
      t.integer "sponsor_id"
    end

    create_table "documents", :force => true do |t|
      t.integer  "seminar_id"
      t.string   "title"
      t.text     "description"
    end

    add_index "documents", "seminar_id"

    create_table "languages", :force => true do |t|
      t.string   "name"
    end

    create_table "page_blocks", :force => true do |t|
      t.string   "identifier"
      t.text     "content"
    end

    add_index "page_blocks", ["identifier"], :name => "index_page_blocks_on_identifier"

    create_table "pages", :force => true do |t|
      t.string   "identifier"
      t.string   "page_title"
      t.text     "content"
      t.string   "seo_title"
      t.string   "seo_description"
      t.string   "seo_keywords"
    end

    add_index "pages", ["identifier"], :name => "index_pages_on_identifier"

    create_table "practice_areas", :force => true do |t|
      t.string   "name"
    end

    create_table "speakers", :force => true do |t|
      t.string   "name"
      t.string   "position"
      t.text     "about"
      t.string   "email"
      t.string   "website"
      t.integer  "priority",           :default => 0
      t.string   "photo_file_name"
      t.string   "photo_content_type"
      t.integer  "photo_file_size"
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
      t.string   "name"
      t.text     "description"
      t.string   "website"
      t.string   "email"
      t.integer  "priority",          :default => 0
      t.string   "logo_file_name"
      t.string   "logo_content_type"
      t.integer  "logo_file_size"
    end 

    create_table "panels", :force => true do |t|
      t.integer "seminar_id"
      t.string "title"
      t.text "description"
      t.string   "logo_file_name"
      t.string   "logo_content_type"
      t.integer  "logo_file_size"      
    end

    add_index "panels", "seminar_id"

    create_table "panels_sponsors", :id => false, :force => true do |t|
      t.integer "panel_id"
      t.integer "sponsor_id"
    end

    create_table "panels_speakers", :id => false, :force => true do |t|
      t.integer "panel_id"
      t.integer "speaker_id"
    end

  end

  def self.down
  end

end
