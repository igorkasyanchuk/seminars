class Admin::SpeakersController < Admin::DashboardController
	respond_to :html, :xml, :json
  actions :all, :except => :show 

  def index
    @speakers = Speaker.by_name.all
  end

  def refresh
    @speaker = resource
    redirect_to :back, :notice => "#{@speaker.refresh_info ? 'Successfully: ' : 'Error: '} imported from INFO"
  end

  def create
    create! do |success, failure|
      success.html { redirect_to [:admin, :speakers] }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to [:admin, :speakers] }
    end
  end
end
