require  "./spec/spec_helper"

describe Parser do

	before :each do
		@index_page = File.read("spec/data/index_page.html")
		@last_index_page = File.read("spec/data/last_index_page.html")
		@wikipedia_page = File.read("spec/data/wikipedia_page.html")
	end
	
	describe "#next_page_path" do
		it "should find the next page path when there is one" do
			parser = Parser.new(@index_page)
			parser.next_page_path.should == "/w/index.php?title=Special:AllPages&from=%22C%22+word"
		end
		it "should return nill when on the last page" do
			parser = Parser.new(@last_index_page)
			parser.find_next_page_link.should be_nil
		end
	end
	
	describe "#find_articles" do
		it "should return articles that are not italicized" do
			parser = Parser.new(@index_page)
			parser.find_articles.should include("!!!Fuck_You!!!")
			parser.find_articles.should include("!WOWOW!")
		end
		it "Should not return articles that are italicized (are redirects)" do
			parser = Parser.new(@index_page)
			parser.find_articles.should_not include("!Oh Gloria Inmarcesible!")
			parser.find_articles.should_not include("\"Boys are stupid, throw rocks at them!\" controversy")
		end
	end
	
	describe "#find_first_link" do
		it "should return the first link" do
			parser = Parser.new(@wikipedia_page)
			parser.first_link.should == "http://en.wikipedia.org/wiki/Sex_organ"
		end
	end
end
