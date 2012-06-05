class Admin::MediansController < Admin::DashboardController
  respond_to :html, :xml, :json
  actions :all, :except => :show 

  def index
    @medians = Median.by_name.all
  end

  def create
    create! do |success, failure|
      success.html { redirect_to [:admin, :medians] }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to [:admin, :medians] }
    end
  end   
end
