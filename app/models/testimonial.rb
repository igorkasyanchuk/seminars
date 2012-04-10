class Testimonial < ActiveRecord::Base
  has_attached_file :photo, :styles => {:small => "120x120>", :medium => "150x150!"},
                    :url => "/system/:class/:attachment/:id/:style/:filename"

  validates_presence_of :author
  validates_presence_of :content

  belongs_to :city

  scope :randomiza, order("rand()")
  scope :randomize, order("rand()")
end
