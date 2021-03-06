require 'open-uri'

class Sponsor < ActiveRecord::Base
  has_attached_file :logo, 
    :styles => { :medium => "100x100>", :thumb => "x50", :thumb2x => 'x75', :thumb3x => 'x100' }, 
    :url => "/system/:class/:attachment/:id/:style/:filename"

  has_and_belongs_to_many :seminars, :uniq => true
  has_and_belongs_to_many :panels, :uniq => true
  has_and_belongs_to_many :languages,
    :uniq => true,
    :after_add => :update_languages_count, 
    :after_remove => :update_languages_count    

  has_and_belongs_to_many :practice_areas, 
    :uniq => true,
    :after_add => :update_practice_areas_count,
    :after_remove => :update_practice_areas_count

  has_and_belongs_to_many :real_seminars, 
    :join_table => "real_sponsors_seminars", 
    :foreign_key => "seminar_id", 
    :uniq => true, 
    :class_name => 'Seminar',
    :association_foreign_key => 'real_sponsor_id'

  validates_presence_of :name

  scope :ordered, order("priority")
  scope :with_logo, where('logo_file_name is not null')
  scope :by_name, order("name")

  def update_languages_count(e)
    unless destroyed?
      self.languages_count = self.languages.count
      self.save(:validate => false)
    end
  end

  def update_practice_areas_count(e)
    unless destroyed?
      self.practice_areas_count = self.practice_areas.count
      self.save(:validate => false)
    end
  end  

  def to_param
    "#{id}-#{self.name}".downcase.gsub(/[^a-z0-9A-Z]+/i, '-')
  end

  def seo_title
    self.name
  end

  def seo_description
    self.description
  end

  def refresh_info
    begin
      e = Firm.find(self.owner_id)
      self.name = e.name
      self.description = e.description
      self.save(:validate => false)
      true
    rescue
      false
    end
  end  

  def photo_from_url(image_url)
    io = open(URI.parse(image_url))
    def io.original_filename; base_uri.path.split('/').last; end
    io.original_filename.blank? ? nil : io
    attachment_for(:logo).assign(io)
  end

  def self.from_firm a
    if Sponsor.where(:owner_id => a.id).any?
      puts "already in DB"
      return nil
    end
    s = Sponsor.new
    s.name = a.name
    s.firm = a.firm
    s.website = a.web_site
    s.email = a.contact_email
    s.description = a.description
    s.owner_type = 'advisor'
    s.owner_id = a.id
    s.contact_phone = a.contact_phone
    s.skype = a.contact_skype
    s.country = a.country
    s.address = a.address
    s.city = a.city
    s.zip = a.zip
    s.linked_in = a.linked_in
    s.twitter = a.twitter
    s.facebook = a.facebook
    s.photo_from_url "http://eb5info.com#{a.logo.url(:original, false)}" if a.logo_file_name.present?
    s
  end  
end