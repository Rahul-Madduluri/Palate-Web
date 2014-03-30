class AddOfficialRatingToSongs < ActiveRecord::Migration
  def change
  	add_column :songs, :official_rating, :decimal
  end
end
