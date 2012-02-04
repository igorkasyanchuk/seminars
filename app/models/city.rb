class City < ActiveRecord::Base
  has_attached_file :photo, :styles => {:small => "120x90>", :medium => "170x80>", :big => "980x345>"},
                            :url => "/system/:class/:attachment/:id/:style/:filename"

  has_many :seminars, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :country
  validates_attachment_presence :photo

  scope :us_cities, where(:country => "United States")
  scope :international_cities, where("country <> 'United States'")
  scope :for_home_page, where(:for_home_page => true)
end
