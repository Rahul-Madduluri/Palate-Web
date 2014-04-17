class ArtistsController < ApplicationController

	before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user,	only: :destroy




	def create
		@artist = Artist.build(movie_params)
	end



	def destroy
	end

	def show
		@artist = Artist.find(params[:id])
    	@user_feed_items  = current_user.microposts.take(20)
	end



	private
		def artist_params
			params.require(:artist).permit(:id, :name, :twitter_handle, :echonest_id, :image_url, :spotify_uri)
	    end


	    
	 




end
