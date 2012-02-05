require 'open-uri'

def import_attorneys
  Attorney.all.each do |attorney|
    puts "processing: #{attorney.name}"
    speaker = Speaker.from_attorney(attorney)
    if speaker.save
      puts 'saved'
    else
      puts speaker.errors
    end
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
    end
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
    end
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
    end
  end  
end

desc "import attorneys from eb5info => seminars"
task :import_attorneys => :environment do 
  import_attorneys
end

desc "import service providers from eb5info => seminars"
task :import_service_providers => :environment do 
  import_service_providers
end


desc "import advisors from eb5info => seminars"
task :import_advisors => :environment do 
  import_advisors
end

desc "import firms from eb5info => seminars"
task :import_firms => :environment do 
  import_firms
end

desc 'import all'
task :import_all => :environment do
  import_firms
  import_advisors
  import_attorneys
  import_service_providers
end
