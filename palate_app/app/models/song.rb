class Song < ActiveRecord::Base

	belongs_to :artist
	has_many :palate_recommendations, as: :media


	has_many :user_songs, dependent: :destroy
 	has_many :users, through: :user_songs

	default_scope -> { order('created_at DESC') }
	validates :artist_id, presence: true
	validates :echonest_id, presence: true
	validates :title, presence: true

end
