class Seminar < ActiveRecord::Base
  has_and_belongs_to_many :sponsors, :uniq => true
  has_and_belongs_to_many :speakers, :uniq => true
  has_and_belongs_to_many :medians, :uniq => true

  belongs_to :city
  has_many :panels, :dependent => :destroy
  has_many :documents, :dependent => :destroy

  has_many :videos, :through => :panels
  has_many :photos, :through => :panels
  has_many :presentations, :through => :panels


  has_and_belongs_to_many :real_sponsors, 
    :join_table => "real_sponsors_seminars", 
    :foreign_key => "real_sponsor_id", 
    :uniq => true, 
    :class_name => 'Sponsor', 
    :association_foreign_key => 'seminar_id'

  has_attached_file :photo, :styles => {:small => "120x90>", :medium => "170x80>", :big => "980x345>"},
                            :url => "/system/:class/:attachment/:id/:style/:filename"

  validates_presence_of :title
  validates_presence_of :ends_on
  validates_presence_of :start_on

  scope :upcoming, where('DATE(seminars.ends_on) >= DATE(NOW())')
  scope :past, where('DATE(seminars.ends_on) < DATE(NOW())')
  scope :by_date, order("start_on")
  scope :from_new_to_old, order("start_on asc")

  def event_range
    if start_on == ends_on
      start_on.strftime('%B %d, %Y')
    elsif start_on.month == ends_on.month
      "#{start_on.strftime('%B %d')}-#{ends_on.strftime('%d, %Y')}"
    else
      "#{start_on.strftime('%B %d')} - #{ends_on.strftime('%B %d, %Y')}"
    end
  end

  def past?
    ends_on < Date.today
  end

  def to_param
    "#{id}-#{self.title}".downcase.gsub(/[^a-z0-9A-Z]+/i, '-')[0..60]
  end


  def speakers(scope = :scoped)
    res = ActiveRecord::Base.connection.execute("SELECT DISTINCT speaker_id FROM panels_speakers where panel_id in (#{panel_ids.join(',')})").inject([]) {|res, e| res << e.first; res}
    Speaker.send(scope).where(:id => res)
    rescue 
      Speaker.where(0)
  end

  def sponsors(scope = :scoped)
    res = ActiveRecord::Base.connection.execute("SELECT DISTINCT sponsor_id FROM panels_sponsors where panel_id in (#{panel_ids.join(',')})").inject([]) {|res, e| res << e.first; res}
    Sponsor.send(scope).where(:id => res)
    rescue 
      Sponsor.where(0)
  end

  def media(scope = :scoped)
    res = ActiveRecord::Base.connection.execute("SELECT DISTINCT median_id FROM medians_panels where panel_id in (#{panel_ids.join(',')})").inject([]) {|res, e| res << e.first; res}
    Median.send(scope).where(:id => res)
    rescue 
      Median.where(0)
  end  

end