class MediansController < InheritedResources::Base
  actions :show

  def show
    @page = Page["media"]
    @media = Median.find(params[:id])
    @selected_menu = 'seminars'
  end

end