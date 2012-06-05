class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.integer :panel_id
      t.text :video_code
      t.string :title
      t.text :description
    end
    add_index :videos, :panel_id
  end

  def self.down
    remove_index :videos, :panel_id
    drop_table :videos
  end
end
