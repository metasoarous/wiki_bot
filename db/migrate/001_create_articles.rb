class CreateArticles < ActiveRecord::Migration
	def self.up
		create_table :articles do |t|
			t.column :title, :string, :null => false
			t.column :points_to_id, :integer
		end
	end

	def self.down
		drop_table :articles
	end
end
