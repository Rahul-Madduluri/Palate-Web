class AddPersonalRatingToUserSongs < ActiveRecord::Migration
  def change
  	add_column :user_songs, :personal_rating, :decimal
  end
end
