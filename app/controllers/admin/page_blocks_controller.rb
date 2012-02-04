class Admin::PageBlocksController < Admin::DashboardController
  actions :all, :except => :show 

  def create
    create! do |success, failure|
      success.html { redirect_to [:admin, :page_blocks] }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to [:admin, :page_blocks] }
    end
  end
end