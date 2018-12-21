class Tag < ApplicationRecord
	has_many :taggings
	has_many :posts, through: :taggings
	def self.counts
		self.select("name, count(taggings.tag_id) as count").joins(:taggings).where('tags.name' => count ).group("taggings.tag_id")		
	end

 
end