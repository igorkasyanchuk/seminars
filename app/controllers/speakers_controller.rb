class SpeakersController < InheritedResources::Base
  actions :show
  
  def show
    @page = Page["speakers"]
    @speaker = Speaker.find(params[:id])
    @selected_menu = 'speakers'
  end

end