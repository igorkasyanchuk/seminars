class Sponsor < ActiveRecord::Base
	has_attached_file :logo, :styles => { :medium => "100x100>", :thumb => "x50" }

  has_and_belongs_to_many :seminars, :uniq => true
  has_and_belongs_to_many :panels, :uniq => true

  validates_presence_of :name

  scope :ordered, order("priority")  
end