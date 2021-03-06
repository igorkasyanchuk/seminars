class Admin::SponsorsController < Admin::DashboardController
  respond_to :html, :xml, :json
  actions :all, :except => :show 

  def index
    @sponsors = Sponsor.by_name.all
  end

  def refresh
    @sponsor = resource
    redirect_to :back, :notice => "#{@sponsor.refresh_info ? 'Successfully: ' : 'Error: '} imported from INFO"
  end

  def create
    create! do |success, failure|
      success.html { redirect_to [:admin, :sponsors] }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to [:admin, :sponsors] }
    end
  end   
end
