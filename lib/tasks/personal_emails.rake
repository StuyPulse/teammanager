require 'update_personal_emails'

namespace :update_personal_emails do
  desc "Update personal emails from CSV"
  task :update, [:csv_file] => :environment do |task, args|
    update_personal_emails(args.csv_file)
  end
end
