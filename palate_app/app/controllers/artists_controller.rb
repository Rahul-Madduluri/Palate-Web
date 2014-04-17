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
		def movie_params
			params.require(:movie).permit(:id, :title, :year, :adventurousness, :instinctiveness, :pace, :valence, :freshness, :critics_rating, :url, :official_rating)
	    end


	    
	 




end
