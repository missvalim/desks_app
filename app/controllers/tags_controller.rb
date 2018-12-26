class TagsController < ApplicationController
	def show
		@tag = Tag.find_by(name: params[:id])
		@posts = @tag.posts
	end
	def index
    @tags = ActsAsTaggableOn::Tag.all.most_used
    end
end