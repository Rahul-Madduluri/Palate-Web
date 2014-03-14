class MoviesController < ApplicationController

	before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user,	only: :destroy




	def create
		@movie = Movie.build(movie_params)
	end



	def destroy
	end





	private
		def movie_params
			params.require(:movie).permit(:title, :year, :adventurousness, :instinctiveness, :pace, :valence, :freshness, :critics_rating, :url)
	    end


	    
	 




end

