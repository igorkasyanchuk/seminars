class Admin::PanelsController < Admin::DashboardController
  belongs_to :seminar
  respond_to :html, :xml, :json
  actions :all, :except => :show 

  def create
    create! do |success, failure|
      success.html { redirect_to [:admin, @seminar, :panels] }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to [:admin, @seminar, :panels] }
    end
  end  
end
