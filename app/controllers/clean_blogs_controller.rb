class CleanBlogsController < ApplicationController
	layout "clean_blog"

	def index
		 @favor = Favor.order('created_at DESC').all
	end

	def about
	end

	def post
	end

	def contact
	end
end
