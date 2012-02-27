class Admin::DashboardController < InheritedResources::Base
  include ActionView::Helpers::JavaScriptHelper
  include ActionView::Helpers::NumberHelper

  respond_to :html, :xml, :json
  layout 'admin'

  USER, PASSWORD = 'admin', 'admin12345'
  before_filter :authenticate
  before_filter :set_logged_in
  
  def welcome
  end
  
  private
    
    def authenticate
      authenticate_or_request_with_http_basic do |id, password|
        id == USER && password == PASSWORD
      end
    end

    def set_logged_in
      session["logged_in"] = 'yes'
    end

end