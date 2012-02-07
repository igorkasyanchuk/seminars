class AddTicketHtmlToSeminar < ActiveRecord::Migration
  def self.up
    add_column :seminars, :tickets_html, :text, :default => ""
    Seminar.update_all(:tickets_html => "")
  end

  def self.down
    remove_column :seminars, :tickets_html
  end
end
