class AddNeededFieldsToSpeakersSponsors < ActiveRecord::Migration
  def self.up
    add_column :speakers, :owner_type, :string
    add_column :speakers, :owner_id, :integer
    add_column :sponsors, :owner_type, :string
    add_column :sponsors, :owner_id, :integer

    [:firm, :contact_phone, :skype, :country, :address, :city, :zip, :linked_in, :twitter, :facebook].each do |c|
      add_column :speakers, c, :string
    end
  end

  def self.down
    add_column :speakers, :owner_type
    add_column :speakers, :owner_id
    add_column :sponsors, :owner_type
    add_column :sponsors, :owner_id

    [:firm, :contact_phone, :skype, :country, :address, :city, :zip, :linked_in, :twitter, :facebook].each do |c|
      remove_column :speakers, c
    end
  end
end
