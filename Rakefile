require 'active_record'
require 'yaml'

task :default => :spec

task :migrate => :environment do
	ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
end


task :environment do
	ENV["APP_ENV"] ||= "production"
	config = YAML::load(File.open('db/config.yml'))[ENV["APP_ENV"]]
  ActiveRecord::Base.establish_connection(config)
end

# Might have to debug this yet...
task :spec do
	ENV["APP_ENV"] = :test
	Dir.entries("./spec").each do |file|
		case file
		when /(?:\w)+_spec.rb/
			system("rspec " + "spec/" +file)
		end
	end
end
