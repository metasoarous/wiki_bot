
require File.join( "./spec/spec_helper")

describe Bot do
	before :all do
		@bot = Bot.new
	end
	it "should know how to get a page without raising" do
		lambda {@bot.get "www.wikipedia.org"}.should_not raise_error
	end
	it "should return a string with the web page results" do
		response = @bot.get "www.wikipedia.org"
		response.should be_a(String)
		response.should include("The Free Encyclopedia")
	end
end

describe Bot::DatabasePopulator do
	
end
