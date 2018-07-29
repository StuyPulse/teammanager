require 'fill_team_emails'

namespace :fill_team_emails do
  desc "Fill team emails from CSV"
  task :update, [:csv_file] => :environment do |task, args|
    fill_team_emails(args.csv_file)
  end
end
