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
	
		if current_user.adventurousness_affinity.nil?
        	adventurousness = @movie.adventurousness/20
        	instinctiveness = @movie.instinctiveness/20
        	pace = @movie.pace/20
        	valence = @movie.valence/20
        	freshness = @movie.freshness/20
        else
        	adventurousness = @movie.adventurousness/20 + current_user.adventurousness_affinity
        	instinctiveness = @movie.instinctiveness/20 + current_user.instinctiveness_affinity
        	pace = @movie.pace/20 + current_user.pace_affinity
        	valence = @movie.valence/20 + current_user.valence_affinity
        	freshness = @movie.freshness/20 + current_user.freshness_affinity
        end

        current_user.update_attribute(:adventurousness_affinity, adventurousness)
		current_user.update_attribute(:instinctiveness_affinity, instinctiveness)
		current_user.update_attribute(:pace_affinity, pace)
		current_user.update_attribute(:valence_affinity, valence)
		current_user.update_attribute(:freshness_affinity, freshness)

		respond_to do |format|
			format.js
			format.html
		end
		
	end





end
