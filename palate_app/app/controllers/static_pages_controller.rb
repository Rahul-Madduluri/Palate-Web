class StaticPagesController < ApplicationController

    def home
    	if signed_in?
    		songs = Echowrap.song_search(:min_danceability => ((current_user.pace_affinity + current_user.instinctiveness_affinity + current_user.valence_affinity)/3), 
    										min_energy: ((current_user.pace_affinity + current_user.valence_affinity)/2), 
    										:min_acousticness => (((1 - current_user.pace_affinity) + (1 - current_user.valence_affinity))/2), 
    										:artist_min_familiarity => 0.6, 
    										:bucket => ["id:spotify-WW","tracks"],
    										:results => 5)
      		songs.each do |song|
                if Artist.where(echonest_id: song.artist_id).blank?
                    artist_url = Echowrap.artist_images(id: song.artist_id, results: 1)[0].url
                    Artist.create!(name: song.artist_name, echonest_id: song.artist_id, image_url: artist_url)
                end
                if Song.where(echonest_id: song.id).blank?
                    artist = Artist.find_by(echonest_id: song.artist_id)
                    Song.create!(title: song.title, echonest_id: song.id, artist_id: artist.id)
                end
                new_song = Song.find_by(echonest_id: song.id)
	      		post_content = new_song.title + "\n" + new_song.artist.name + new_song.artist.image_url
	            current_user.palate_recommendations.create(content: post_content, media_id: new_song.id)
	        end
      		@micropost  = current_user.microposts.build
     		@feed_items = current_user.feed
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
