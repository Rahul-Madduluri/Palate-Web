class AddEchonestIdIndexToSong < ActiveRecord::Migration
  def change

  	add_index :songs, :echonest_id

  end
end
