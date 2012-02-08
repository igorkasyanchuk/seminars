class Admin::SponsorsController < Admin::DashboardController
  respond_to :html, :xml, :json
  actions :all, :except => :show 

  def index
    @sponsors = Sponsor.by_name.all
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
