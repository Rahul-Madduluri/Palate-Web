class AddIndexesToUserArtistRelationship < ActiveRecord::Migration
  def change
  	add_index :user_artists, :user_id
    add_index :user_artists, :artist_id
    add_index :user_artists, [:user_id, :artist_id], unique: true
  end
end
