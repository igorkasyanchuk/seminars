class Sponsor < ActiveRecord::Base
	has_attached_file :logo, :styles => { :medium => "100x100>", :thumb => "x50" }, :url => "/system/:class/:attachment/:id/:style/:filename"

  has_and_belongs_to_many :seminars, :uniq => true
  has_and_belongs_to_many :panels, :uniq => true

  validates_presence_of :name

  scope :ordered, order("priority")  

  def photo_from_url(image_url)
    io = open(URI.parse(image_url))
    def io.original_filename; base_uri.path.split('/').last; end
    io.original_filename.blank? ? nil : io
    attachment_for(:logo).assign(io)
  end

  def self.from_firm a
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