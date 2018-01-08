require 'contact_form_importer'

namespace :contact_form do
  desc "Import students and parents from contact form CSV"
  task :import, [:csv_file] => :environment do |task, args|
    c = ContactFormImporter.new
    c.import_from_file(args.csv_file)
  end
end
