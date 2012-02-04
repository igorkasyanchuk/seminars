class Admin::DashboardController < InheritedResources::Base
  include ActionView::Helpers::JavaScriptHelper
  include ActionView::Helpers::NumberHelper

  respond_to :html, :xml, :json
  layout 'admin'

  USER, PASSWORD = 'admin', 'admin12345'
  before_filter :authenticate
  
  def welcome
  end
  
  private
    
    def authenticate
      authenticate_or_request_with_http_basic do |id, password|
        id == USER && password == PASSWORD
      end
    end

end