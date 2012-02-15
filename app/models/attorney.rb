class Attorney < ActiveRecord::Base
  establish_connection "info"
  has_attached_file :photo
  has_and_belongs_to_many :practice_areas
  has_and_belongs_to_many :languages
end
