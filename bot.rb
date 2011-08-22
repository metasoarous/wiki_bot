require "net/http"

class Bot
	def get(address)
	
	end
	
	class DatabasePopulator < self
		BASE_ADDRESS = "end.wikipedia.org/wiki/Special:AllPages/"
	
		def parse_indices
			(0..9).each {|i| parse_index(i) }
			("A".."Z").each do |l1|
				("a".."z").each do |l2|
					parse_index(l1 + l2)
					parse_index(l1 + (l2.capitalize))
				end
			end
		end
		
		def parse_index(index)
			string = get(BASE_ADDRESS + index )
			articles = some_fucked_up_parse_function_written_with_nokogiri
			articles.each {|name| Article.create(:name => name)}
			# scroll through pages of the index and parse (grab all the article 
			# names using nokogiri madness) and create article records
		end
	end
end
