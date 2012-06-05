class Admin::VideosController < Admin::DashboardController
  belongs_to :panel
	respond_to :html, :xml, :json
  actions :all, :except => :show

  def create
    create! do |success, failure|
      success.html { redirect_to [:admin, @panel, :videos] }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to [:admin, @panel, :videos] }
    end
  end  
end