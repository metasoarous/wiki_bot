require "rubygems"

require "bundler/setup"

Bundler.require :default

ENV["APP_ENV"] = "production"

ActiveRecord::Base.establish_connection(
	adapter: 		"sqlite3",
	database: 	ENV["database"],
	pool: 			5,
  timeout: 		5000
)


require "./article"
require "./controller"
require "./bot"


