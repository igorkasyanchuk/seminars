class VenueController < ApplicationController

  def venue
    @city = City.find params[:id]
    @selected_menu = 'venue'
    render '/home/venue'
  end

end