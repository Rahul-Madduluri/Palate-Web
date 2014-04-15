class User < ActiveRecord::Base

    #microposts and recommendations
    has_many :microposts, dependent: :destroy
    has_many :palate_recommendations, dependent: :destroy

    #artist relationships
    has_many :user_artists, dependent: :destroy
    has_many :artists, through: :user_artists

    #song relationships
    has_many :user_songs, dependent: :destroy
    has_many :songs, through: :user_songs


    #movie relationships
    has_many :user_movies, dependent: :destroy
    has_many :movies, through: :user_movies


    #user relationships
    has_many :relationships, foreign_key: "follower_id", dependent: :destroy
    has_many :followed_users, through: :relationships, source: :followed
    has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
    has_many :followers, through: :reverse_relationships, source: :follower

	before_save { self.email = email.downcase }

    #remember token
	before_create :create_remember_token

    #name of user
    validates :name,  presence: true, length: { maximum: 50 }
    
    #email
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

    #password
    has_secure_password
    validates :password, length: { minimum: 6 }

    #entertainment attributes
    validates :adventurousness_affinity, presence: true, on: :update_attributes
    validates :instinctiveness_affinity, presence: true, on: :update_attributes
    validates :pace_affinity, presence: true, on: :update_attributes
    validates :pace_affinity, presence: true, on: :update_attributes
    validates :freshness_affinity, presence: true, on: :update_attributes


    # remember token / encryption
    def User.new_remember_token
    	SecureRandom.urlsafe_base64
    end

    def User.encrypt(token)
    	Digest::SHA1.hexdigest(token.to_s)
  	end


    #rate media
    def rated?(media)
        if (media.is_a? Song)
            result =  user_songs.find_by(song_id: media.id).present?
        elsif (media.is_a? Movie)
            result =  user_movies.find_by(movie_id: media.id).present?
        end
        result
    end

    def rate!(media, rating)
        if (media.is_a? Song)
            user_songs.find_by(song_id: media.id).update_attribute(:personal_rating, rating)
        elsif (media.is_a? Movie)
            user_movies.find_by(movie_id: media.id).update_attribute(:personal_rating, rating)
        end  
    end

    def rating_for(media)
        if (media.is_a? Song)
            unless user_songs.find_by(song_id: media.id).nil?
                result = user_songs.find_by(song_id: media.id).personal_rating
            end
        elsif (media.is_a? Movie)
            unless user_movies.find_by(movie_id: media.id).nil?
                result = user_movies.find_by(movie_id: media.id).personal_rating
            end
        end
        result
    end

    # following other users
    def following?(other_user)
        relationships.find_by(followed_id: other_user.id)
    end

    def follow!(other_user)
        relationships.create!(followed_id: other_user.id)
    end

    def unfollow!(other_user)
        relationships.find_by(followed_id: other_user.id).destroy
    end


    # music
    def listening_to?(artist)
        user_artists.find_by(artist_id: artist.id)
    end

    def listen_to!(artist)
        unless (listening_to?(artist) )
            user_artists.create!(artist_id: artist.id)
        end
    end

    def listening_to_song?(song)
        user_songs.find_by(song_id: song.id)
    end

    def listen_to_song!(song)
        unless (listening_to_song?(song) )
            user_songs.create!(song_id: song.id)
        end
    end



    #movies
    def watching?(movie)
        user_movies.find_by(movie_id: movie.id)
    end

    def watch!(movie)
        user_movies.create!(movie_id: movie.id)
    end


    #static pages
    def feed
        array = PalateRecommendation.for_user(self).zip(Micropost.from_users_followed_by(self)).flatten.compact
        array
    end





 	private

    	def create_remember_token
      		self.remember_token = User.encrypt(User.new_remember_token)
    	end



end

