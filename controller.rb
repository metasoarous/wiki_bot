class Controller

	# This basically just goes and grabs ALL of the wikipedia article titles
	def populate_database
		DatabasePopulator.populate_db
	end
	
	# Goes and fetches all of the link_to values and then updates the associated
	# records so that they point to those articles.
	def parse_all
		
	end
	
	
end
