class Admin::PagesController < Admin::DashboardController
  actions :all, :except => :show
  def create
    create! do |success, failure|
      success.html { redirect_to [:admin, :pages] }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to [:admin, :pages] }
    end
  end
end