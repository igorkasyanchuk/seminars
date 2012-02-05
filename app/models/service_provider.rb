class ServiceProvider < ActiveRecord::Base
  has_attached_file :photo
  has_and_belongs_to_many :service_provider_practice_areas
  has_and_belongs_to_many :languages

  def practice_areas
    self.service_provider_practice_areas
  end
end
