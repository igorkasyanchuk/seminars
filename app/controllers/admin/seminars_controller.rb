class Admin::SeminarsController < Admin::DashboardController
  belongs_to :city
  respond_to :html, :xml, :json
  actions :all, :except => :show 

  def create
    create! do |success, failure|
      success.html { redirect_to [:admin, @city, :seminars] }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to [:admin, @city, :seminars] }
    end
  end  
end
