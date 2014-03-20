class AddMediaToPalateRecommendation < ActiveRecord::Migration
  def change
  	add_column :palate_recommendations, :media_id, :integer
  	add_column :palate_recommendations, :media_type, :string
  end
end
