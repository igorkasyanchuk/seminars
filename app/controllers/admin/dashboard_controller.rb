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

  def import
    Importer.import
    redirect_to '/admin', :notice => 'Imported.'
  end

  def refresh
    (Sponsor.all + Speaker.all).each do |e|
      e.refresh_info
    end
    redirect_to '/admin', :notice => 'Refreshed.'
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