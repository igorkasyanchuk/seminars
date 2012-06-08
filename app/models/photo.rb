class Photo < ActiveRecord::Base
  belongs_to :panel
  has_attached_file :photo, :styles => { :thumb_small => ["24x24!", :png], :thumb => ["85x110!", :png], :normal => ["670x400>", :png], :preview => ['640x420!', :png] }
  validates_attachment_presence :photo

  scope :for_panel_view, limit(8).order("rand()")
end
