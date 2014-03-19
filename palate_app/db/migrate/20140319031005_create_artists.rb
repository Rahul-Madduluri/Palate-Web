class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :twitter_handle, unique: true
      t.string :echonest_id, unique: true

      t.timestamps
    end
    add_index :artists, [:echonest_id]
  end
end
