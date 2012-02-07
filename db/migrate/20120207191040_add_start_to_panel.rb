class AddStartToPanel < ActiveRecord::Migration
  def self.change
    add_column :panels, :start_at, :datetime
  end
end
