class AddStartToPanel12 < ActiveRecord::Migration
  def self.up
    add_column :panels, :start_at, :datetime rescue nil
  end
  def self.down
    remove_column :panels, :start_at rescue nil
  end
end
