
require "./spec/spec_helper"

describe Article do
	before :each do
		Article.destroy_all
	end
	describe "creation" do
		it "should work with a title" do
			Article.create(:title => "Some Title")
			Article.count.should == 1
		end
		it "should not be valid without a title" do
			article = Article.new()
			article.should_not be_valid
		end
	end
	
	describe "#path" do
		before :each do
			@article = Article.create :title => "Some Wikipedia title"
		end
		it "should return the title underscored" do
			@article.path.should == "Some_Wikipedia_title"
		end
	end
	
end


