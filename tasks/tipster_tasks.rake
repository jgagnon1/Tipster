# desc "Explaining what the task does"
# task :tipster do
#   # Task goes here
# end

namespace :db do
  namespace :migrate do 
    desc  "Migrate the database through scripts in vendor/plugins/tipster/lib/db/migrate"
    task  :tipster => :environment do 
      ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
      ActiveRecord::Migrator.migrate("vendor/plugins/tipster/lib/db/migrate/", ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
      Rake::Task["db:schema:dump"].invoke if ActiveRecord::Base.schema_format == :ruby
    end
  end
end
