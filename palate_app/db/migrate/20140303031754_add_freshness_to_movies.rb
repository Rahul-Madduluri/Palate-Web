class AddFreshnessToMovies < ActiveRecord::Migration
  def change
  	add_column :movies, :freshness, :integer
  end
end
