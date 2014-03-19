class User < ActiveRecord::Base

    #microposts and recommendations
    has_many :microposts, dependent: :destroy
    has_many :palate_recommendations, dependent: :destroy

    #artist relationships
    has_many :user_artists, dependent: :destroy
    has_many :artists, through: :user_artists


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



    def User.new_remember_token
    	SecureRandom.urlsafe_base64
    end

    def User.encrypt(token)
    	Digest::SHA1.hexdigest(token.to_s)
  	end

    def following?(other_user)
        relationships.find_by(followed_id: other_user.id)
    end

    def follow!(other_user)
        relationships.create!(followed_id: other_user.id)
    end

    def unfollow!(other_user)
        relationships.find_by(followed_id: other_user.id).destroy
    end

    def listening_to?(artist)
        user_artists.find_by(artist_id: artist.id)
    end

    def listen_to!(artist)
        user_artists.create!(artist_id: artist.id)
    end

    def feed
        array = PalateRecommendation.for_user(self).zip(Micropost.from_users_followed_by(self)).flatten.compact
        array
    end

    def add_firstbite(movie, userID)

        current_user = User.find_by(id: userID)

        adventurousness = movie.adventurousness/20
        instinctiveness = movie.instinctiveness/20
        pace = movie.pace/20
        valence = movie.valence/20
        freshness = movie.freshness/20

        current_user.adventurousness_affinity += adventurousness
        current_user.instinctiveness_affinity += instinctiveness
        current_user.pace_affinity += pace
        current_user.valence_affinity += valence
        current_user.freshness_affinity += freshness

        current_user.update_attributes(adventurousness_affinity: adventurousness, instinctiveness_affinity: instinctiveness, pace_affinity: pace, valence_affinity: valence, freshness_affinity: freshness)

    end





 	private

    	def create_remember_token
      		self.remember_token = User.encrypt(User.new_remember_token)
    	end



end
