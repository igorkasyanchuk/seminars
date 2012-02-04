class SeminarsController < InheritedResources::Base
  actions :index, :show, :agenda, :price, :venue, :speakers
  
  def agenda
    @page = Page["agenda"]
    @seminar = resource
    @selected_menu = 'agenda'
    render '/home/agenda'
  end

  def speakers
    @page = Page["speakers"]
    @seminar = resource
    @speakers = @seminar.speakers.ordered
    @selected_menu = 'speakers'
    render '/home/speakers'
  end

end