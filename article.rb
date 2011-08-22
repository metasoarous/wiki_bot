class Article < ActiveRecord::Base
	belongs_to :points_to, :class_name => "Article"
	
	validates_presence_of :title
	
	def path
		title.split(" ").join("_")
	end
end
