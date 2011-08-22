require "net/http"

class Bot
	def get(address)
		Net::HTTP.get(address)
	end
	
	class DatabasePopulator < self
		BASE_ADDRESS = "end.wikipedia.org/wiki/Special:AllPages/"
	
		def populate_database
			parse_index(BASE_ADDRESS + "!")
		end
		
		def parse_index(address)
			result = get(address)
			@next_page = Parser.find_next_page(result)
			@articles = Parser.find_all_titles(result)
			
			@articles.each {|name| Article.create(:title => name)}
			
			parse_index(@next_page) if @next_page
		end
	end
end
