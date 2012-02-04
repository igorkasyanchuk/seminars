class Admin::LanguagesController < Admin::DashboardController
  respond_to :html, :xml, :json
  actions :all, :except => :show 

  def create
    create! do |success, failure|
      success.html { redirect_to [:admin, :languages] }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to [:admin, :languages] }
    end
  end    
end