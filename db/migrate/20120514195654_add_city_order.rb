class AddCityOrder < ActiveRecord::Migration
  def self.up
    add_column :cities, :priority, :integer, :default => 0
    City.update_all :priority => 0
  end

  def self.down
    remove_column :cities, :priority
  end
end
