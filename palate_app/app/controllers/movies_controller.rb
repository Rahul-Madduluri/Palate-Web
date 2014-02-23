class MoviesController < ApplicationController
	include MoviesHelper

	before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user,	only: :destroy
	before_action :next_bite,		only: :update_user




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

	def update_user
		
		#MAKE THIS A FUNCTION IN THE MODEL
		current_user.adventurousness_affinity = params[:adventurousness]
		current_user.instinctiveness_affinity = params[:instinctiveness]
		current_user.pace_affinity = params[:pace]
		current_user.valence_affinity = params[:valence]
		current_user.save



		respond_to do |format|
      		format.html do
      			#redirect_to firstbite_url
      			firstbite
      			redirect_to firstbite_url
      		end
      		format.js
    	end

	end


	private
		def movie_params
			params.require(:movie).permit(:title, :year, :adventurousness, :instinctiveness, :pace, :valence, :freshness, :critics_rating, :url)
	    end


	    def next_bite
	    	@presetmovies = @allmovies.next
	    end

	 




end

