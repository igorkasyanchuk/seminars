class AddRealSponsortSeminarsTable < ActiveRecord::Migration
  def self.up
    create_table :real_sponsors_seminars, :id => false do |t|
      t.integer :real_sponsor_id
      t.integer :seminar_id
    end
    add_index :real_sponsors_seminars, :seminar_id
  end

  def self.down
    remove_index :real_sponsors_seminars, :seminar_id
    drop_table :real_sponsors_seminars
  end
end
