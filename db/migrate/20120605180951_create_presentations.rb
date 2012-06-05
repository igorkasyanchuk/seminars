class CreatePresentations < ActiveRecord::Migration
  def self.up
    create_table :presentations do |t|
      t.integer :panel_id
      t.string :title
      t.text :description
      t.string   "file_file_name"
      t.string   "file_content_type"
      t.integer  "file_file_size"
      t.datetime  "file_updated_at"
      t.timestamps
    end
    add_index :presentations, :panel_id
  end

  def self.down
    remove_index :presentations, :panel_id
    drop_table :presentations
  end
end
