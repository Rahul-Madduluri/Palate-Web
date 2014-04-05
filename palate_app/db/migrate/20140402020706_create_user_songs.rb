class CreateUserSongs < ActiveRecord::Migration
  def change
    create_table :user_songs do |t|
      t.integer :user_id
      t.integer :song_id

      t.timestamps
    end

    add_column :user_songs, :user_rating, :integer

    add_index :user_songs, :user_id
    add_index :user_songs, :song_id
    add_index :user_songs, [:user_id, :song_id], unique: true

  end
end
