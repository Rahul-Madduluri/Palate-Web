class Song < ActiveRecord::Base

	belongs_to :artist
	default_scope -> { order('created_at DESC') }
	validates :artist_id, presence: true
	validates :title, presence: true

end
