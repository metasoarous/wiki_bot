require "rubygems"

require "bundler/setup"

Bundler.require :default

ENV["APP_ENV"] ||= "production"


config = YAML::load(File.open('db/config.yml'))[ ENV["APP_ENV"] ]
ActiveRecord::Base.establish_connection(config)


require "./article"
require "./controller"
require "./bot"


