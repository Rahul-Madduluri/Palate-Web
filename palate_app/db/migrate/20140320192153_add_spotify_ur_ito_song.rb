class AddSpotifyUrItoSong < ActiveRecord::Migration
  def change
  	add_column :songs, :spotify_uri, :string
  	add_column :artists, :spotify_uri, :string
  end
end
