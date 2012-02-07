class AddStartToPanel < ActiveRecord::Migration
  def self.up
    add_column :panels, :start_at, :datetime
  end
  def self.down
    remove_column :panels, :start_at
  end
end
