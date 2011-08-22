require "./spec/spec_helper"

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
	describe "parse_index method" do
		before :each do
			@bot = Bot::DatabasePopulator.new
		end
		it "should not raise" do
			lambda {@bot.parse_index("A")}.should_not raise_error
		end
		it "should go get a page" do
			@bot.parse_index("A")
			Article.count.should_not == 0
		end
	end
end
