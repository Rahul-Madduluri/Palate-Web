class CreateUserMovies < ActiveRecord::Migration
  def change
    create_table :user_movies do |t|
      t.string :user_id
      t.string :movie_id

      t.timestamps
    end

    add_index :user_movies, :user_id
    add_index :user_movies, :movie_id
    add_index :user_movies, [:user_id, :movie_id], unique: true

  end
end
