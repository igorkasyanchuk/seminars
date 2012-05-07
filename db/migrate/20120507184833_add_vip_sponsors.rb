class AddVipSponsors < ActiveRecord::Migration
  def self.up
    add_column :sponsors, :premium, :boolean, :default => false
    Sponsor.update_all(:premium => false)
  end

  def self.down
    remove_column :sponsors, :premium
  end
end
