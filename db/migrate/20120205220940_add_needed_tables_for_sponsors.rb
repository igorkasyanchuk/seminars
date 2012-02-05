class AddNeededTablesForSponsors < ActiveRecord::Migration
  def self.up
    create_table :languages_sponsors, :id => false do |t|
      t.integer :language_id
      t.integer :sponsor_id
    end
    create_table :practice_areas_sponsors, :id => false do |t|
      t.integer :practice_area_id
      t.integer :sponsor_id
    end
  end

  def self.down
    drop_table :languages_sponsors
    drop_table :practice_areas_sponsors
  end
end
