class AddPreviewImages < ActiveRecord::Migration
  def self.up
    [:presentations, :videos].each do |t|
      add_column t, :preview_file_name, :string
      add_column t, :preview_content_type, :string
      add_column t, :preview_file_size, :integer
      add_column t, :preview_updated_at, :datetime
    end
  end

  def self.down
    [:presentations, :videos].each do |t|
      remove_column :t, :preview_file_name
      remove_column :t, :preview_content_type
      remove_column :t, :preview_file_size
      remove_column :t, :preview_updated_at
    end
  end
end
