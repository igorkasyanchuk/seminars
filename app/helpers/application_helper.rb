module ApplicationHelper
  SITE_NAME = " | OverseasFunding.com"
  SITE_NAME_LENGTH = SITE_NAME.length


  def add_editor
    content_for :css do
      stylesheet_link_tag '/redactor/css/editor.css'
    end
    content_for :js do
      javascript_include_tag '/redactor/editor.js'
    end
  end
  
  def editor(element) 
    content_for :on_ready do 
      "$('#{element}').editor(redactor);".html_safe
    end
  end 

  def w3c_date(date)
    date.utc.strftime("%Y-%m-%dT%H:%M:%S+00:00")
  end

  def yield_or_default(message, default_message = "")
    message.nil? ? default_message : message
  end
  
  def flash_messages
    messages = []
    %w(notice warning error).each do |msg|
      messages << "<div class='#{msg} flash'>#{html_escape(flash[msg.to_sym])}</div>" unless flash[msg.to_sym].blank?
    end
    flash.clear
    messages.join.html_safe
  end

  def inside_layout(layout = 'application', &block) 
    render :inline => capture_haml(&block), :layout => "layouts/#{layout}" 
  end

  def description(t)
    content_for :description do
      t + " | " + DESCRIPTION
    end
  end  

  def keywords(t)
    content_for :keywords do
      t + " | " + KEYWORDS
    end
  end     

  def title(t)
    content_for :title do
      truncate(t, :length => 70 - SITE_NAME_LENGTH, :omission => '') + SITE_NAME
    end
  end

  def include_google_analytics
    render :partial => '/shared/ga' if Rails.env == 'production'
  end

  def pc(identifier, default = '')
    (PageBlock.find_or_create_by_identifier(identifier).content || default).html_safe
  end

  def active_link page
    @selected_menu == page ? 'active' : ''
  end

  def httpize(url)
    if url && url !~ /http:\/\//
      'http://' + url
    else
      url
    end
  end

  def line(text, klass = '')
    content_tag :div, :class => 'line_top' do
      [
        (content_tag :div, '', :class => 'line_placeholder'),
        (content_tag :div, '', :class => "line_content_bg #{klass}"),
        (content_tag :div, text, :class => 'line_content')
      ].join.html_safe
    end
  end
  
end