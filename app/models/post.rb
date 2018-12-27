class Post < ApplicationRecord
	validates :title, :body, :adres, presence: true
	mount_uploader :image, ImageUploader
	has_many :taggings
	has_many :tags, through: :taggings
	has_many :comments
	belongs_to :user
 def self.search(search)
 	if search
 		where(["body LIKE ?","%#{search}%"])

	else
		all
	end
 end

 def all_tags=(names)
  self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
  end
 end

 def all_tags
  self.tags.map(&:name).join(", ")

 end
    
end
