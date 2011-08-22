require File.join( "./spec/spec_helper")

describe Parser do

	before :each do
		@parser = Parser.new
		@index_page = File.read("data/index_page.html")
		@last_index_page = File.read("data/last_index_page.html")
		@wikipedia_page = File.read("data/wikipedia_page.html")
	end
	
	describe "#find_next_page_link" do
		it "should find the next link when there is one" do
			@parser.find_next_page_link( @index_page).should == link_string
		end
		it "should return nill when on the last page" do
			@parser.find_next_page_link(@last_index_page).should be_nil
		end
	end
	
	describe "#find_articles" do
		it "should return articles that are not italicized" do
			@parser.find_articles(@index_page).should include("Some Title")
			@parser.find_articles(@index_page).should include("Some Other Title")
		end
		it "Should not return articles that are italicized (are redirects)" do
			@parser.find_articles(@index_page).should_not include("Some Bad Title")
			@parser.find_articles(@index_page).should_not include("Some Other Bad Title")
		end
	end
	
	describe "#find_first_link" do
		it "should return the first link" do
			@parser.first_link(@wikipedia_page).should == "Whatever it should equal"
		end
	end
end
