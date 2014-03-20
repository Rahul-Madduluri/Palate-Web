class AddEchonestIdToSong < ActiveRecord::Migration
  def change
  	add_column :songs, :echonest_id, :string
  end

end
