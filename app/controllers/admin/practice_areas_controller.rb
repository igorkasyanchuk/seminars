class Admin::PracticeAreasController < Admin::DashboardController
  respond_to :html, :xml, :json
  actions :all, :except => :show 

  def index
    @practice_areas = PracticeArea.by_name.all
  end    

  def create
    create! do |success, failure|
      success.html { redirect_to [:admin, :practice_areas] }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to [:admin, :practice_areas] }
    end
  end  
end
