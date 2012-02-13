class Document < ActiveRecord::Base
  belongs_to :seminar
  has_many :attachments	
  accepts_nested_attributes_for :attachments, :allow_destroy => true, :reject_if => :all_blank
  validates_presence_of :title
end