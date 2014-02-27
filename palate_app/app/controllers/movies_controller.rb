class MoviesController < ApplicationController
	include MoviesHelper

	before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user,	only: :destroy




	def create
		@movie = Movie.build(movie_params)
	end

	def firstbite
		@allmovies = Movie.all.each_slice(2)
		@presetmovies = @allmovies.next


=begin
		respond_to do |format|
	    	format.js
	    	format.html { redirect_to(root_url) }
  		end
=end

	end


	def destroy
	end





	private
		def movie_params
			params.require(:movie).permit(:title, :year, :adventurousness, :instinctiveness, :pace, :valence, :freshness, :critics_rating, :url)
	    end


	    
	 




end

