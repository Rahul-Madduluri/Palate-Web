class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.integer :critics_rating
      t.integer :adventurousness
      t.integer :instinctiveness
      t.integer :pace
      t.integer :valence

      t.timestamps
    end
  end
end
