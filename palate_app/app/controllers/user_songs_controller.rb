class UserSongsController < ApplicationController
  before_action :signed_in_user

  def create
    @song = Song.find(params[:user_song][:song_id])
    @rating = params[:user_song][:personal_rating]
    current_user.listen_to_song!(@song)
    current_user.listen_to!(@song.artist)
    current_user.rate!(@song, @rating)
    redirect_to current_user
  end

  def update
    @song = Song.find(params[:user_song][:song_id])
    @rating = params[:user_song][:personal_rating]
    redirect_to current_user
  end

end
