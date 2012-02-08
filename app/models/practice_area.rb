class PracticeArea < ActiveRecord::Base
  has_and_belongs_to_many :speakers, :join_table => "speakers_practice_areas", :uniq => true
  validates_presence_of :name
  validates_uniqueness_of :name

  scope :by_name, order("name")
end
