class CreateUserArtists < ActiveRecord::Migration
  def change
    create_table :user_artists do |t|
      t.integer :user_id
      t.integer :artist_id

      t.timestamps
    end
    add_index :user_artists, :user_id
    add_index :user_artists, :artist_id
    add_index :user_artists, [:user_id, :artist_id], unique: true

  end
end
