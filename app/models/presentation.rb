class Presentation < ActiveRecord::Base
  belongs_to :panel
  validates_presence_of :title
  has_attached_file :file
  validates_attachment_presence :file  
end
