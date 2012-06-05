class Video < ActiveRecord::Base
  belongs_to :panel
  validates_presence_of :title, :video_code
end
