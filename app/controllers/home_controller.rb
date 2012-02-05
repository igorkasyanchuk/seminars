class HomeController < ApplicationController
  before_filter :load_page, :except => :sitemap

  def index
    @cities = City.for_home_page.all
    @cities_us = City.us_cities.all
    @cities_in = City.international_cities.all
    @selected_menu = 'home'
  end

  def agenda
    @selected_menu = 'agenda'
  end

  def speakers
    @speakers = Speaker.ordered.includes([:practice_areas, :languages])
    @selected_menu = 'speakers'
  end

  def venue
    @selected_menu = 'venue'
  end

  def sponsors
    @sponsors = Sponsor.ordered.includes([:practice_areas, :languages])
    @selected_menu = 'sponsors'
  end

  def resources
    @documents = Document.all
    @selected_menu = 'resources'
  end

  def contact
    @selected_menu = 'contact'
  end

  def about
    @selected_menu = 'about'
  end

  def costs
    @selected_menu = 'costs'
  end

  def sitemap
    headers["Content-Type"] = "text/xml"
    headers["Last-Modified"] = Time.now.utc.strftime("%Y-%m-%dT%H:%M:%S+00:00")
  end

end