class CitiesController < InheritedResources::Base
  def index
    @selected_menu = 'cities'
    @cities = City.by_name.all
  end

  def speakers
    @selected_menu = 'speakers'
    @cities = City.by_name.all
    @city = City.find(params[:id])
    @speakers = @city.speakers
    render '/home/speakers'
  end
end