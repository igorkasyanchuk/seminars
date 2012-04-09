class AddTestimonialPersonPhoto < ActiveRecord::Migration
  def self.up
    add_column :testimonials, :photo_file_name, :string
    add_column :testimonials, :photo_content_type, :string
    add_column :testimonials, :photo_file_size, :integer
    add_column :testimonials, :photo_updated_at, :datetime
    add_column :testimonials, :city_id, :integer
  end

  def self.down
    [:photo_updated_at, :photo_file_size, :photo_content_type, :photo_file_name, :city_id].each do |c|
      remove_column :testimonials, c
    end
  end
end
