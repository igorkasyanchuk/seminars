class Panel < ActiveRecord::Base
  belongs_to :seminar
  has_and_belongs_to_many :sponsors, :uniq => true
  has_and_belongs_to_many :speakers, :uniq => true

  has_attached_file :logo, :styles => {:small => "x200"}, :url => "/system/:class/:attachment/:id/:style/:filename"

  validates_presence_of :title
  validates_presence_of :description
end
