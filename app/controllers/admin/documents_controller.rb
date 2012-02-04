class Admin::DocumentsController < Admin::DashboardController
  belongs_to :seminar
	respond_to :html, :xml, :json
  actions :all, :except => :show

  def new
    @seminar = parent
    @document = @seminar.documents.build
    5.times { @document.attachments.build }
  end

  def create
    create! do |success, failure|
      success.html { redirect_to [:admin, @seminar, :documents] }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to [:admin, @seminar, :documents] }
    end
  end  
end