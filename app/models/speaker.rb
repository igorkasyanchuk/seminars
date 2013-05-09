require 'open-uri'

class Speaker < ActiveRecord::Base
  has_and_belongs_to_many :languages, 
    :join_table => "speakers_languages", 
    :uniq => true, 
    :after_add => :update_languages_count, 
    :after_remove => :update_languages_count

  has_and_belongs_to_many :practice_areas, 
    :join_table => "speakers_practice_areas", 
    :uniq => true,
    :after_add => :update_practice_areas_count,
    :after_remove => :update_practice_areas_count

  has_and_belongs_to_many :seminars, :uniq => true
  has_and_belongs_to_many :panels, :uniq => true

  has_attached_file :photo, 
    :styles => { :medium => "100x137", :thumb => 'x50', :thumb2x => 'x75', :thumb3x => 'x100' }, 
    :url => "/system/:class/:attachment/:id/:style/:filename"

  validates_presence_of :name
  validates_uniqueness_of :name

  scope :ordered, order("priority")
  scope :with_photo, where('photo_file_name is not null')
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
    any_description
  end

  def photo_from_url(image_url)
    io = open(URI.parse(image_url))
    def io.original_filename; base_uri.path.split('/').last; end
    io.original_filename.blank? ? nil : io
    attachment_for(:photo).assign(io)
  end

  def any_description
    if self.about.present?
      self.about
    elsif self.bio.present?
      self.bio
    else
      ""
    end
  end

  def refresh_info
    begin
      e = self.owner_type.classify.constantize.find(self.owner_id)
      self.name = e.name if e.respond_to?(:name)
      self.bio = e.contact_bio if e.respond_to?(:contact_bio)
      self.position = e.title if e.respond_to?(:title)
      self.about = e.description if e.respond_to?(:description)
      self.save(:validate => false)
      true
    rescue
      false
    end
  end

  def self.from_attorney a
    if Speaker.where(:owner_id => a.id, :owner_type => 'attorney').any?
      ss = Speaker.where(:owner_id => a.id, :owner_type => 'attorney').first
      ss.update_attribute(:bio, a.contact_bio)
      ss.update_attribute(:position, a.title)
      puts "skiping, a already in DB"
      return nil
    end
    s = Speaker.new
    s.name = a.name
    s.firm = a.firm
    s.website = a.web_site
    s.email = a.contact_email
    s.about = a.description
    s.owner_type = 'attorney'
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
    s.bio = a.contact_bio
    s.position = a.title
    s.photo_from_url "http://eb5info.com#{a.photo.url(:original, false)}" if a.photo_file_name.present?
    s
  end

  def self.from_service_provider a
    if Speaker.where(:owner_id => a.id, :owner_type => 'service_provider').any?
      ss = Speaker.where(:owner_id => a.id, :owner_type => 'service_provider').first
      ss.update_attribute(:bio, a.contact_bio)
      ss.update_attribute(:position, a.title)
      puts "skiping, sp already in DB"
      return nil
    end
    s = Speaker.new
    s.name = a.name
    s.firm = a.firm
    s.website = a.web_site
    s.email = a.contact_email
    s.about = a.description
    s.owner_type = 'service_provider'
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
    s.bio = a.contact_bio
    s.position = a.title
    s.photo_from_url "http://eb5info.com#{a.photo.url(:original, false)}" if a.photo_file_name.present?
    s
  end

  def self.from_advisor a
    if Speaker.where(:owner_id => a.id, :owner_type => 'advisor').any?
      ss = Speaker.where(:owner_id => a.id, :owner_type => 'advisor').first
      ss.update_attribute(:bio, a.contact_bio)
      ss.update_attribute(:position, a.title)
      puts "skiping, ad already in DB"
      return nil
    end    
    s = Speaker.new
    s.name = a.name
    s.firm = a.firm
    s.website = a.web_site
    s.email = a.contact_email
    s.about = a.description
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
    s.bio = a.contact_bio
    s.position = a.title
    s.photo_from_url "http://eb5info.com#{a.photo.url(:original, false)}" if a.photo_file_name.present?
    s
  end  

end
