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

  def sponsors
    @page = Page["sponsors"]
    @seminar = resource
    @sponsors = @seminar.sponsors.ordered
    @selected_menu = 'sponsors'
    render '/home/sponsors'
  end

  def costs
    @page = Page["costs"]
    @seminar = resource
    @selected_menu = 'costs'
    render '/home/costs'
  end

end