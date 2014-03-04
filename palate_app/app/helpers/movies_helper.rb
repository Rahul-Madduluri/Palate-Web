require 'badfruit'

module MoviesHelper

	def search_movie_and_create(aTitle, aYear)

		bf = BadFruit.new("xkq5yzchy5wnpgjkdfuzb2m6")

		movieID = RottenMovie.find(title: aTitle, year: aYear, limit: 1).id
		aMovie = RottenMovie.find(id: movieID)


		genre_scores = { 'Action & Adventure' 		=> { adventurousness: 0.4, instinctiveness: 0.8, pace: 0.7, valence: 0.6 },
						 'Animation'		  		=> { adventurousness: 0.7, instinctiveness: 0.5, pace: 0.8, valence: 0.8 },
						 'Art House & International'=> { adventurousness: 0.8, instinctiveness: 0.2, pace: 0.2, valence: 0.3 },
						 'Classics'					=> { adventurousness: 0.2, instinctiveness: 0.6, pace: 0.3, valence: 0.5 },
						 'Comedy'					=> { adventurousness: 0.2, instinctiveness: 0.6, pace: 0.3, valence: 0.5 },
						 'Documentary'				=> { adventurousness: 0.1, instinctiveness: 0.1, pace: 0.3, valence: 0.7 },
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

		adventurousness=2.4
		instinctiveness=2.4
		pace=2.4
		valence=2.4

		badfruit_movie = bf.get_movie_info(movieID,"details")
		badfruit_movie = bf.parse_movie_array(JSON.parse(badfruit_movie))






		# add metric values of each genre associated with a movie and find average
		badfruit_movie.genres.each { |genre| adventurousness += genre_scores[genre][:adventurousness]} unless badfruit_movie.genres.empty?
		badfruit_movie.genres.each { |genre| instinctiveness+= genre_scores[genre][:instinctiveness]} unless badfruit_movie.genres.empty?
		badfruit_movie.genres.each { |genre| pace += genre_scores[genre][:pace]} unless badfruit_movie.genres.empty?
		badfruit_movie.genres.each { |genre| valence += genre_scores[genre][:valence]} unless badfruit_movie.genres.empty?

		#adventurousness = adventurousness / aMovie.genres.count
		#instinctiveness = instinctiveness / aMovie.genres.count
		#pace = pace / aMovie.genres.count
		#valence = valence / aMovie.genres.count

		@movie = Movie.create(title: aMovie.title, year: aMovie.year, adventurousness: adventurousness, instinctiveness: instinctiveness, 
			pace: pace, valence: valence, freshness: aMovie.year/Time.now.year, critics_rating: aMovie.ratings.critics_score, url: aMovie.posters.original)


		

	end

	def search_movie_and_create_without_metrics(aTitle, aYear)
		movieID = RottenMovie.find(title: aTitle, year: aYear, limit: 1).id
		aMovie = RottenMovie.find(id: movieID)
		@movie = Movie.create(title: aMovie.title, year: aMovie.year, critics_rating: aMovie.ratings.critics_score, url: aMovie.posters.profile)
		@movie
	end

	def preset_movies

		search_movie_and_create('Slumdog Millionaire', 2008)
		search_movie_and_create('The Avengers', 2012)
		search_movie_and_create('Casino Royale', 2006)
		search_movie_and_create('Titanic', 1997)
		search_movie_and_create("Pan\'s Labyrinth", 2006)
		search_movie_and_create("Happy Gilmore", 1996)
		search_movie_and_create('Rear Window', 1954)
		search_movie_and_create('Superbad', 2007)
		search_movie_and_create('The Good, the Bad, and the Ugly', 1966) 
		search_movie_and_create('The Matrix', 1999)
		search_movie_and_create('Gladiator', 2000)
		search_movie_and_create('Memento', 2000)
		search_movie_and_create('Saw', 2004)
		search_movie_and_create('WALL-E', 2008)
		search_movie_and_create('Fight Club', 1999)
		search_movie_and_create('The Godfather', 1972)
		search_movie_and_create('Die Hard', 1988)
		search_movie_and_create('The Incredibles', 2004)
		search_movie_and_create('The Sixth Sense', 1999)
		search_movie_and_create('The Notebook', 2004)
		search_movie_and_create('The Silence of the Lambs', 1991)
		search_movie_and_create('The Terminator', 1984)
		search_movie_and_create('Forgetting Sarah Marshall', 2008)
		search_movie_and_create('Harry Potter and the Prisoner of Azkaban', 2004)
		search_movie_and_create('The Wizard of Oz', 1939)
		search_movie_and_create('Pulp Fiction', 1994)
		search_movie_and_create('Star Wars', 1977)
		search_movie_and_create('The Bourne Identity', 2002)
		search_movie_and_create('When Harry Met Sally', 1989)
		search_movie_and_create('Knocked Up', 2007)
		search_movie_and_create('Devil Wears Prada', 2006)
		search_movie_and_create('Bridesmaids', 2011)
		search_movie_and_create('The Help', 2011)
		search_movie_and_create('The Blind Side', 2009)
		search_movie_and_create("Ocean\'s Eleven", 2001)
		search_movie_and_create("Good Will Hunting", 1997)
		search_movie_and_create('Flight', 2012)
		search_movie_and_create('Seven', 1995)
		search_movie_and_create('Unforgiven', 1992) 
		search_movie_and_create('3:10 to Yuma', 2007)

	end


	


end

