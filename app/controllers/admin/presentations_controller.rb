class Admin::PresentationsController < Admin::DashboardController
  belongs_to :panel
	respond_to :html, :xml, :json
  actions :all, :except => :show

  def create
    create! do |success, failure|
      success.html { redirect_to [:admin, @panel, :presentations] }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to [:admin, @panel, :presentations] }
    end
  end  
end