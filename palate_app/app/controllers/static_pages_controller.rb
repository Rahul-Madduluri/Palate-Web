class StaticPagesController < ApplicationController

    def home
    	if signed_in?


            generate_newsfeed_recommendations

      		
      		@micropost  = current_user.microposts.build
     		@feed_items = current_user.feed.take(15)
            @users = User.take(6)
    	end
  	end


	def firstbite
		@allmovies = Movie.all.each_slice(2)
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
        current_user.save

		respond_to do |format|
			format.js
			format.html
		end
		
	end

    
    def update_personal_rating

        media = Song.find_by(params[:media])
        rating = params[:rating]
        if (media.is_a? Song)
            current_user.listen_to!(media.artist)
            current_user.listen_to!(media)
            #relationship = User_Song.find_by(user_id: current_user.id, song_id: media.id)
            #relationship.update_attribute(:personal_rating, rating)

        elsif (media.is_a? Movie)
            current_user.watch!(media)
            relationship = User_Movie.find_by(user_id: current_user.id, movie_id: media.id)
            relationship.update_attribute(:personal_rating, rating)
        end


        respond_to do |format|
            format.js
            format.html
        end
    end

    private
        def generate_newsfeed_recommendations
            generate_music_recommendations
            generate_movie_recommendations
        end

        def generate_music_recommendations
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
                    unless (song.tracks[0].nil?)
                        spotify_uri = song.tracks[0].foreign_id.sub!('spotify-WW','spotify')
                        if (spotify_uri != nil && Song.where(title: song.title, artist: artist).blank?)
                            Song.create!(title: song.title, echonest_id: song.id, artist: artist, spotify_uri: spotify_uri)
                            new_song = Song.find_by(echonest_id: song.id)
                            post_content = new_song.title + "\n" + new_song.artist.name + " " +new_song.artist.image_url

                            current_user.palate_recommendations.create!(content: post_content, media:new_song)
                        end
                    #else
                        #Song.create!(title: song.title, echonest_id: song.id, artist: artist)
                        

                    end

                end

            end
                
        end

        def generate_movie_recommendations
            movies = Movie.find(:all, conditions: ["adventurousness > ? AND adventurousness < ?", 0.2, 0.6]).take(2)
            movies.each do |movie|
                post_content = movie.title + "\n" + movie.year.to_s + " " + movie.url
                current_user.palate_recommendations.create!(content: post_content, media:movie)
            end

        end




end
