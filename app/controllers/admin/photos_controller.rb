class Admin::PhotosController < Admin::DashboardController
  belongs_to :panel
	respond_to :html, :xml, :json
  actions :all, :except => :show

  def index
    index! { @photo = @panel.photos.build }
  end

  def create
    create! do |success, failure|
      success.html { redirect_to [:admin, @panel, :photos] }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to [:admin, @panel, :photos] }
    end
  end  
end