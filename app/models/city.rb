class City < ActiveRecord::Base
  has_attached_file :photo, :styles => {:small => "120x90>", :medium => "150x90!", :medium2 => "100x67>", :big => "980x385#"},
                            :url => "/system/:class/:attachment/:id/:style/:filename"

  has_many :seminars, :dependent => :destroy
  has_many :documents, :through => :seminars

  validates_presence_of :name
  validates_presence_of :country
  validates_attachment_presence :photo

  scope :us_cities, where(:country => "United States")
  scope :international_cities, where("country <> 'United States'")
  scope :for_home_page, where(:for_home_page => true)
  scope :by_name, order("name")

  def to_param
    "#{id}-#{self.name}".downcase.gsub(/[^a-z0-9A-Z]+/i, '-')
  end  
end
