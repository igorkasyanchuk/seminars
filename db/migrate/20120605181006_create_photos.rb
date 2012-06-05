class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.integer :panel_id
      t.string :title
      t.text :description
      t.string   "photo_file_name"
      t.string   "photo_content_type"
      t.integer  "photo_file_size"
      t.datetime  "photo_updated_at"
    end
    add_index :photos, :panel_id
  end

  def self.down
    remove_index :photos, :panel_id
    drop_table :photos
  end
end
