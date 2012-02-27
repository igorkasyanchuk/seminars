class ApplicationController < ActionController::Base
  layout 'application'
  protect_from_forgery

  helper_method :logged_in?

  def self.set_menu(item)
    class_eval %(
      before_filter :set_active_menu
      protected
        def set_active_menu
          @selected_menu = '#{item}'
        end)
  end

  def logged_in?
    session["logged_in"].present? && session["logged_in"] == 'yes'
  end

  private
    def load_page
      @page = Page[action_name]
    end  
end
