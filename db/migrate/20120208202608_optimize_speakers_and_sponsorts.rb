class OptimizeSpeakersAndSponsorts < ActiveRecord::Migration
  def self.up
    add_column :speakers, :languages_count, :integer, :default => 0
    add_column :speakers, :practice_areas_count, :integer, :default => 0
    Speaker.reset_column_information
    Speaker.all.each do |s|
      Speaker.update_counters s.id, :languages_count => s.languages.count
      Speaker.update_counters s.id, :practice_areas_count => s.practice_areas.count
    end
  end

  def self.down
    remove_column :speakers, :languages_count
    remove_column :speakers, :practice_areas_count
  end
end
