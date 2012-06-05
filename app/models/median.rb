class Median < ActiveRecord::Base
  has_attached_file :logo, 
    :styles => { :medium => "100x100>", :thumb => "x50", :thumb2x => 'x75', :thumb3x => 'x100' }, 
    :url => "/system/:class/:attachment/:id/:style/:filename"

  has_and_belongs_to_many :seminars, :uniq => true
  has_and_belongs_to_many :panels, :uniq => true

  validates_presence_of :name

  scope :ordered, order("priority")
  scope :with_logo, where('logo_file_name is not null')
  scope :by_name, order("name")

  def to_param
    "#{id}-#{self.name}".downcase.gsub(/[^a-z0-9A-Z]+/i, '-')
  end

  def seo_title
    self.name
  end

  def seo_description
    self.description
  end

end