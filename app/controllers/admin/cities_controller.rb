class Admin::CitiesController < Admin::DashboardController
  respond_to :html, :xml, :json
  actions :all, :except => :show 

  def create
    create! do |success, failure|
      success.html { redirect_to [:admin, :cities] }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to [:admin, :cities] }
    end
  end
end
