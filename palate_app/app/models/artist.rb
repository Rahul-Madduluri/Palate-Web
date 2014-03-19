class Artist < ActiveRecord::Base

	has_many :user_artists, dependent: :destroy
	has_many :users, through: :user_artists

	validates :name, presence: true
	validates :echonest_id, presence: true
	validates :twitter_handle
	validates :image_url

end
