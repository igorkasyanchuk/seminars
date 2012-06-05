class AddMedia < ActiveRecord::Migration
  def self.up
    create_table "medians_panels", :id => false, :force => true do |t|
      t.integer "median_id"
      t.integer "panel_id"
    end
    create_table "medians_seminars", :id => false, :force => true do |t|
      t.integer "median_id"
      t.integer "seminar_id"
    end
    create_table "medians", :force => true do |t|
      t.string  "name"
      t.text    "description"
      t.string  "website"
      t.string  "email"
      t.integer "priority",             :default => 0
      t.string  "logo_file_name"
      t.string  "logo_content_type"
      t.integer "logo_file_size"
      t.datetime "logo_updated_at"
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
      t.integer "languages_count",      :default => 0
      t.integer "practice_areas_count", :default => 0
      t.boolean "premium",              :default => false
    end
  end

  def self.down
    drop_table "medians"
    drop_table "medians_seminars"
    drop_table "medians_panels"
  end
end
