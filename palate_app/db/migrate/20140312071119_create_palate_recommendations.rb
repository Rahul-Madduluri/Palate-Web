class CreatePalateRecommendations < ActiveRecord::Migration
  def change
    create_table :palate_recommendations do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :palate_recommendations, [:user_id, :created_at]
  end
end
