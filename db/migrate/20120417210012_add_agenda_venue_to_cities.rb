class AddAgendaVenueToCities < ActiveRecord::Migration
  def self.up
    add_column :cities, :agenda, :text
    add_column :cities, :venue, :text
  end

  def self.down
    remove_column :cities, :agenda
    remove_column :cities, :venue
  end
end
