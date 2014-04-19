class MoviesController < ApplicationController

	before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user,	only: :destroy




	def create
		@movie = Movie.build(movie_params)
	end



	def destroy
	end

	def show
		@movie = Movie.find(params[:id])
    	@user_feed_items  = current_user.microposts.take(20)
    	@users = User.take(6)
	end



	private
		def movie_params
			params.require(:movie).permit(:id, :title, :year, :adventurousness, :instinctiveness, :pace, :valence, :freshness, :critics_rating, :url, :official_rating)
	    end


	    
	 




end

