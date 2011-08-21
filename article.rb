class Article < ActiveRecord::Base
	belongs_to :points_to, :class_name => "Article"
end
