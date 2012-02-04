class Speaker < ActiveRecord::Base
  has_and_belongs_to_many :languages, :join_table => "speakers_languages", :uniq => true
  has_and_belongs_to_many :practice_areas, :join_table => "speakers_practice_areas", :uniq => true
  has_and_belongs_to_many :seminars, :uniq => true
  has_and_belongs_to_many :panels, :uniq => true

  has_attached_file :photo, :styles => { :medium => "x137" }, :url => "/system/:class/:attachment/:id/:style/:filename"

  validates_presence_of :name

  scope :ordered, order("priority")
end
