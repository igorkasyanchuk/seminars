class CitiesController < InheritedResources::Base
  actions :show, :index

  def index
    @selected_menu = 'cities'
    @cities = City.by_name.all
  end
end