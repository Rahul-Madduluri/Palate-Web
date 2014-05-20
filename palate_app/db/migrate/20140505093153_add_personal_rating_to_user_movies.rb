class AddPersonalRatingToUserMovies < ActiveRecord::Migration
  def change
  	add_column :user_movies, :personal_rating, :decimal
  end
end
