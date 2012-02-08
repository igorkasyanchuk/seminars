class Language < ActiveRecord::Base
  has_and_belongs_to_many :speakers, :join_table => "speakers_languages", :uniq => true
  validates_presence_of :name

  scope :by_name, order("name")
end
