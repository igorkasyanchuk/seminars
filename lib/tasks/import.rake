desc 'import all'
task :import_all => :environment do
  Importer.import
end