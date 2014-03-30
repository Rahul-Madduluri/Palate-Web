class AddOfficialRatingToMovies < ActiveRecord::Migration
  def change
  	add_column :movies, :official_rating, :decimal
  end
end
