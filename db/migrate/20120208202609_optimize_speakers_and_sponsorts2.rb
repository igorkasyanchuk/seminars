class OptimizeSpeakersAndSponsorts2 < ActiveRecord::Migration
  def self.up
    add_column :sponsors, :languages_count, :integer, :default => 0
    add_column :sponsors, :practice_areas_count, :integer, :default => 0
    Sponsor.reset_column_information
    Sponsor.all.each do |s|
      Sponsor.update_counters s.id, :languages_count => s.languages.count
      Sponsor.update_counters s.id, :practice_areas_count => s.practice_areas.count
    end
  end

  def self.down
    remove_column :sponsors, :languages_count
    remove_column :sponsors, :practice_areas_count
  end
end
