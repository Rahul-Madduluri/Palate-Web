class RemoveUserRatingsFromUserSongs < ActiveRecord::Migration
  def change
  	remove_column :user_songs, :user_rating, :decimal
  end
end
