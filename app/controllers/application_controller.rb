class ApplicationController < ActionController::Base
  layout 'application'
  protect_from_forgery

  def self.set_menu(item)
    class_eval %(
      before_filter :set_active_menu
      protected
        def set_active_menu
          @selected_menu = '#{item}'
        end)
  end

  private
    def load_page
      @page = Page[action_name]
    end  
end
