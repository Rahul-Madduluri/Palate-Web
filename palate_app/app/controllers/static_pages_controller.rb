class StaticPagesController < ApplicationController

    def home
    	if signed_in?
      		@micropost  = current_user.microposts.build
     		@feed_items = current_user.feed.paginate(page: params[:page])
    	end
  	end


	def firstbite
		@allmovies = Movie.all.each_slice(2)
		#@presetmovies = @allmovies.next


=begin
		respond_to do |format|
	    	format.js
	    	format.html { redirect_to(root_url) }
  		end
=end

	end


	def update_movie_attr

		@movie = Movie.find(params[:id])

		respond_to do |format|
			format.js
			format.html
		end
		
	end





end
