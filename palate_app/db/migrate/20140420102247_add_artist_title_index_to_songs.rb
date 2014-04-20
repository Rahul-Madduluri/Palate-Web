class AddArtistTitleIndexToSongs < ActiveRecord::Migration
  def change
  	add_index :songs, [:title, :artist_id], unique: true
  end
end
