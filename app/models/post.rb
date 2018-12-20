class Post < ApplicationRecord
	validates :title, :body, presence: true
	mount_uploader :image, ImageUploader
	has_many :taggings
	has_many :tags, through: :taggings
	belongs_to :user
 def self.search(search)
 	if search
 		where(["body LIKE ?","%#{search}%"])
	else
		all
	end
 end
 def all_tags
		self.tags.map(&:name).join(',')

	end
	def all_tags=(names)
		self.tags = names.split(',').map do |name|
			Tag.where(name: name.strip).first_or_create!
		
	end
end
end
