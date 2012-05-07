class AddDefaultCityVenue < ActiveRecord::Migration
  def self.up
    add_column :cities, :default_city, :boolean, :default => false
    City.update_all(:default_city => false)
  end

  def self.down
    remove_column :cities, :default_city
  end
end
