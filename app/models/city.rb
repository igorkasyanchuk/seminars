class City < ActiveRecord::Base

  has_attached_file :photo, :styles => {:small => "120x90>", :medium => "150x90!", :medium2 => "100x67>", :big => "980x385#"},
                            :url => "/system/:class/:attachment/:id/:style/:filename"

  has_many :seminars, :dependent => :destroy
  has_many :documents, :through => :seminars

  has_many :panels, :through => :seminars

  has_many :sponsors, :through => :panels

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

  def self.default_city
    City.where(:default_city => true).first
  end

  def speakers(scope = :scoped)
    res = ActiveRecord::Base.connection.execute("SELECT DISTINCT speaker_id FROM panels_speakers where panel_id in (#{panel_ids.join(',')})").inject([]) {|res, e| res << e.first; res}
    Speaker.send(scope).where(:id => res).includes([:languages, :practice_areas])
    rescue 
      Speaker.where(0)
  end

  def sponsors(scope = :scoped)
    res = ActiveRecord::Base.connection.execute("SELECT DISTINCT sponsor_id FROM panels_sponsors where panel_id in (#{panel_ids.join(',')})").inject([]) {|res, e| res << e.first; res}
    Sponsor.send(scope).where(:id => res).includes([:languages, :practice_areas])
    rescue 
      Sponsor.where(0)
  end

end
