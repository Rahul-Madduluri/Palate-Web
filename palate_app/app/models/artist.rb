class Artist < ActiveRecord::Base

	#user
	has_many :user_artists, dependent: :destroy
	has_many :users, through: :user_artists

	#song
	has_many :songs, dependent: :destroy

	validates :name, presence: true
	validates :echonest_id, presence: true
	validates :twitter_handle, presence: true
	validates :image_url, presence: true

end
