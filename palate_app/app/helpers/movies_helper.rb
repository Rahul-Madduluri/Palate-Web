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

	def preset_movies
		  search_movie_and_create_without_metrics('Rear Window', 1954)
		  search_movie_and_create_without_metrics('Saw', 2004)
		  search_movie_and_create_without_metrics('The Good, the Bad, and the Ugly', 1966) 
		  search_movie_and_create_without_metrics('Casino Royale', 2006)
		  search_movie_and_create_without_metrics("Pan\'s Labyrinth", 2006)
		  search_movie_and_create_without_metrics('Gladiator', 2000)
		  search_movie_and_create_without_metrics('Fight Club', 1999)
		  search_movie_and_create_without_metrics('Slumdog Millionaire', 2008)
		  search_movie_and_create_without_metrics('Die Hard', 1988)
		  search_movie_and_create_without_metrics('The Sixth Sense', 1999)
		  search_movie_and_create_without_metrics('The Silence of the Lambs', 1991)
		  search_movie_and_create_without_metrics('Forgetting Sarah Marshall', 2008)
		  search_movie_and_create_without_metrics('The Wizard of Oz', 1939)
		  search_movie_and_create_without_metrics('Star Wars', 1977)
		  search_movie_and_create_without_metrics('When Harry Met Sally', 1989)
		  search_movie_and_create_without_metrics('Devil Wears Prada', 2006)
		  search_movie_and_create_without_metrics('The Help', 2011)
		  search_movie_and_create_without_metrics("Ocean\'s Eleven", 2001)
		  search_movie_and_create_without_metrics('Flight', 2012)
		  search_movie_and_create_without_metrics('Unforgiven', 1992) 
		  search_movie_and_create_without_metrics('Superbad', 2007)
		  search_movie_and_create_without_metrics('WALL-E', 2008)
		  search_movie_and_create_without_metrics('The Matrix', 1999) 
		  search_movie_and_create_without_metrics('Titanic', 1997)
		  search_movie_and_create_without_metrics("Happy Gilmore", 1996)
		  search_movie_and_create_without_metrics('Memento', 2000)
		  search_movie_and_create_without_metrics('The Godfather', 1972)
		  search_movie_and_create_without_metrics('The Avengers', 2012)
		  search_movie_and_create_without_metrics('The Incredibles', 2004)
		  search_movie_and_create_without_metrics('The Notebook', 2004)
		  search_movie_and_create_without_metrics('The Terminator', 1984)
		  search_movie_and_create_without_metrics('Harry Potter and the Prisoner of Azkaban', 2004)
		  search_movie_and_create_without_metrics('Pulp Fiction', 1994)
		  search_movie_and_create_without_metrics('The Bourne Identity', 2002)
		  search_movie_and_create_without_metrics('Knocked Up', 2007)
		  search_movie_and_create_without_metrics('Bridesmaids', 2011)
		  search_movie_and_create_without_metrics('The Blind Side', 2009)
		  search_movie_and_create_without_metrics("Good Will Hunting", 1997)
		  search_movie_and_create_without_metrics('Seven', 1995)
		  search_movie_and_create_without_metrics('3:10 to Yuma', 2007)

		  
	end


	


end

