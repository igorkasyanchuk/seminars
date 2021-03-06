class Panel < ActiveRecord::Base
  belongs_to :seminar
  has_and_belongs_to_many :sponsors, :uniq => true
  has_and_belongs_to_many :speakers, :uniq => true
  has_and_belongs_to_many :medians, :uniq => true

  has_many :presentations
  has_many :videos
  has_many :photos

  has_attached_file :logo, :styles => {:small => "x200"}, :url => "/system/:class/:attachment/:id/:style/:filename"

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :start_at

  scope :by_start_at, order("panels.start_at")
  scope :by_title, order(:title)

  def start_time
    start_at.strftime("%m/%d/%Y %I:%M %p") if start_at
  end

  def time
    if ends_at.present?
      time_full
    else
      time_short
    end rescue nil
  end

  def time_full
    if start_at.present? && ends_at.present? && start_at < ends_at
      "from #{start_at.strftime('%I:%M %p')} till #{ends_at.strftime('%I:%M %p')}"
    end
  end

  def time_short
    start_at.strftime("%I:%M %p") if start_at
  end

  def date
    start_at.strftime("%m/%d/%Y") if start_at
  end

  def self.all_speakers_ids
    res = ActiveRecord::Base.connection.execute("SELECT DISTINCT speaker_id FROM panels_speakers").inject([]) {|res, e| res << e.first; res}
    res << 0 if res.blank?
    res
  end

  def self.all_sponsors_ids
    res = ActiveRecord::Base.connection.execute("SELECT DISTINCT sponsor_id FROM panels_sponsors").inject([]) {|res, e| res << e.first; res}
    res << 0 if res.blank?
    res
  end  
end
