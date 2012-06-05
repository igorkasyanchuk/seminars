class AddEndsAtColumnToPanel < ActiveRecord::Migration
  def self.up
    add_column :panels, :ends_at, :datetime
  end
  def self.down
    remove_column :panels, :ends_at
  end
end
