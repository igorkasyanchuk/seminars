require 'open-uri'

class Importer
  
  def import_attorneys
    Attorney.all.each do |attorney|
      puts "processing: #{attorney.name}"
      speaker = Speaker.from_attorney(attorney)
      if speaker.save
        puts 'saved'
      else
        puts speaker.errors
      end if speaker
    end
  end

  def import_service_providers
    ServiceProvider.all.each do |p|
      puts "processing: #{p.name}"
      speaker = Speaker.from_service_provider(p)
      if speaker.save
        puts 'saved'
      else
        puts speaker.errors
      end if speaker
    end  
  end

  def import_advisors
    Advisor.all.each do |p|
      puts "processing: #{p.name}"
      speaker = Speaker.from_advisor(p)
      if speaker.save
        puts 'saved'
      else
        puts speaker.errors
      end if speaker
    end  
  end

  def import_firms
    Firm.all.each do |p|
      puts "processing: #{p.name}"
      sponsor = Sponsor.from_firm(p)
      if sponsor.save
        puts 'saved'
      else
        puts sponsor.errors
      end if sponsor
    end  
  end

  def add_practice_areas
    Speaker.all.each do |speaker|
      owner = case speaker.owner_type
        when 'advisor' then Advisor
        when 'service_provider' then ServiceProvider
        when 'attorney' then Attorney
      end.find(speaker.owner_id)
      languages = owner.languages.collect{|e| e.name}
      languages.each do |_language|
        language = Language.find_or_create_by_name _language
        speaker.languages << language unless speaker.languages.exists?(language)
      end
      areas = owner.practice_areas.collect{|e| e.name}
      areas.each do |_area|
        area = PracticeArea.find_or_create_by_name _area
        speaker.practice_areas << area unless speaker.practice_areas.exists?(area)
      end
    end
    Sponsor.all.each do |sponsor|
      owner = Firm.find sponsor.owner_id
      languages = owner.languages.collect{|e| e.name}
      languages.each do |_language|
        language = Language.find_or_create_by_name _language
        sponsor.languages << language unless sponsor.languages.exists?(language)
      end
      areas = owner.practice_areas.collect{|e| e.name}
      areas.each do |_area|
        area = PracticeArea.find_or_create_by_name _area
        sponsor.practice_areas << area unless sponsor.practice_areas.exists?(area)
      end
    end
  end

  def self.import
    klass = Importer.new
    klass.import_firms
    klass.import_advisors
    klass.import_attorneys
    klass.import_service_providers
  end

end