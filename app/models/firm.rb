class Firm < ActiveRecord::Base
  establish_connection "info"
  
  has_attached_file :logo
  has_and_belongs_to_many :languages
  has_and_belongs_to_many :firm_practice_areas

  def practice_areas
    self.firm_practice_areas
  end
end
