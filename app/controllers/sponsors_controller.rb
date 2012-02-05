class SponsorsController < InheritedResources::Base
  actions :show

  def show
    @page = Page["sponsors"]
    @sponsor = Sponsor.find(params[:id])
    @selected_menu = 'sponsors'
  end

end