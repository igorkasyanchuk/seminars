class Testimonial < ActiveRecord::Base
  validates_presence_of :author
  validates_presence_of :content

  scope :randomiza, order("rand()")
end
