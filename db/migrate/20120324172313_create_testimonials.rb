class CreateTestimonials < ActiveRecord::Migration
  def self.up
    create_table :testimonials do |t|
      t.string :author
      t.text :content
      t.date :when

      t.timestamps
    end
  end

  def self.down
    drop_table :testimonials
  end
end
