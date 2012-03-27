class AddBioForSpeakers < ActiveRecord::Migration
  def self.up
    add_column :speakers, :bio, :text
  end

  def self.down
    remove_column :speakers, :bio
  end
end
