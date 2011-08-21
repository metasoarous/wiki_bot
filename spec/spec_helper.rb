
require "rubygems"

require "bundler/setup"

Bundler.require :default

require "active_record"

ActiveRecord::Base.establish_connection(
	adapter: 		"sqlite3",
	database: 	"test_database.sqlite3",
	pool: 			5,
  timeout: 		5000
)

require "bot.rb"
require "controller"
require "article"
