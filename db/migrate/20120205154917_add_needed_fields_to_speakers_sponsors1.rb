class AddNeededFieldsToSpeakersSponsors1 < ActiveRecord::Migration
  def self.up
    [:firm, :contact_phone, :skype, :country, :address, :city, :zip, :linked_in, :twitter, :facebook].each do |c|
      add_column :sponsors, c, :string rescue nil
    end
  end

  def self.down
    [:firm, :contact_phone, :skype, :country, :address, :city, :zip, :linked_in, :twitter, :facebook].each do |c|
      remove_column :sponsors, c rescue nil
    end
  end
end
