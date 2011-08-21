require "rubygems"

require "bundler/setup"

Bundler.require :default

ActiveRecord::Base.establish_connection(
	adapter: 		"sqlite3",
	database: 	"database.sqlite3",
	pool: 			5,
  timeout: 		5000
)


require "article"
require "controller"



