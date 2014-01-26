module MoviesHelper

	def search_movie_and_create(aTitle, aYear)

		movieID = RottenMovie.find(title: aTitle, year: aYear, limit: 1).id
		aMovie = RottenMovie.find(id: movieID)


		genre_scores = { 'Action & Adventure' 		=> { adventurousness: 0.4, instinctiveness: 0.8, pace: 0.7, valence: 0.6 },
						 'Animation'		  		=> { adventurousness: 0.7, instinctiveness: 0.5, pace: 0.8, valence: 0.8 },
						 'Art House & International'=> { adventurousness: 0.8, instinctiveness: 0.2, pace: 0.2, valence: 0.3 },
						 'Classics'					=> { adventurousness: 0.2, instinctiveness: 0.6, pace: 0.3, valence: 0.5 },
						 'Comedy'					=> { adventurousness: 0.2, instinctiveness: 0.6, pace: 0.3, valence: 0.5 },
						 'Drama'					=> { adventurousness: 0.5, instinctiveness: 0.6, pace: 0.5, valence: 0.5 },
						 'Horror'					=> { adventurousness: 0.5, instinctiveness: 0.7, pace: 0.4, valence: 0.3 },
						 'Kids & Family'			=> { adventurousness: 0.4, instinctiveness: 0.7, pace: 0.9, valence: 0.9 },
						 'Mystery & Suspense'		=> { adventurousness: 0.7, instinctiveness: 0.4, pace: 0.4, valence: 0.4 },
						 'Musical & Performing Arts'=> { adventurousness: 0.3, instinctiveness: 0.7, pace: 0.8, valence: 0.8 },
						 'Romance'					=> { adventurousness: 0.2, instinctiveness: 0.8, pace: 0.5, valence: 0.6 },
						 'Science Fiction & Fantasy'=> { adventurousness: 0.7, instinctiveness: 0.4, pace: 0.5, valence: 0.6 },
						 'Special Interest'			=> { adventurousness: 0.6, instinctiveness: 0.5, pace: 0.5, valence: 0.5 },
						 'Sports & Fitness'			=> { adventurousness: 0.5, instinctiveness: 0.9, pace: 0.8, valence: 0.8 },
						 'Western'					=> { adventurousness: 0.3, instinctiveness: 0.7, pace: 0.3, valence: 0.6 } }

		adventurousness=0
		instinctiveness=0
		pace=0
		valence=0
		aMovie.genres.each { |genre| genre_scores[:genre][:adventurousness]+=adventurousness}
		aMovie.genres.each { |genre| genre_scores[:genre][:instinctiveness]+=instinctiveness}
		aMovie.genres.each { |genre| genre_scores[:genre][:pace]+=pace}
		aMovie.genres.each { |genre| genre_scores[:genre][:valence]+=valence}
		adventurousness = adventurousness / aMovie.genres.count
		instinctiveness = instinctiveness / aMovie.genres.count
		pace = pace / aMovie.genres.count
		valence = valence / aMovie.genres.count

		@movie = Movie.create(title: aMovie.title, year: aMovie.year, adventurousness: adventurousness, instinctiveness: instinctiveness, 
			pace: pace, valence: valence, freshness: aMovie.year/Time.now.year, critics_rating: aMovie.ratings.critics_score)


		

	end

	def search_movie_and_create_without_metrics(aTitle, aYear)
		movieID = RottenMovie.find(title: aTitle, year: aYear, limit: 1).id
		aMovie = RottenMovie.find(id: movieID)
		@movie = Movie.create(title: aMovie.title, year: aMovie.year, critics_rating: aMovie.ratings.critics_score, url: aMovie.posters.profile)
		@movie
	end

end

