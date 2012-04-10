class Seminar < ActiveRecord::Base
  has_and_belongs_to_many :sponsors, :uniq => true
  has_and_belongs_to_many :speakers, :uniq => true

  belongs_to :city
  has_many :panels, :dependent => :destroy
  has_many :documents, :dependent => :destroy

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
      []
  end

  def sponsors(scope = :scoped)
    res = ActiveRecord::Base.connection.execute("SELECT DISTINCT sponsor_id FROM panels_sponsors where panel_id in (#{panel_ids.join(',')})").inject([]) {|res, e| res << e.first; res}
    Sponsor.send(scope).where(:id => res)
    rescue 
      []
  end

end