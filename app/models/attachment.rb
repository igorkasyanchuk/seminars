class Attachment < ActiveRecord::Base
  belongs_to :document
  has_attached_file :attachment
  validates_attachment_presence :attachment
end
