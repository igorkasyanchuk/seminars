class AgendaController < ApplicationController

  def agenda
    @city = City.find params[:id]
    @selected_menu = 'agenda'
    render '/home/agenda'
  end

end