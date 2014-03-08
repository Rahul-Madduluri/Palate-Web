class ChangeEntertainmentParamsToDecimal < ActiveRecord::Migration
  def change
  	change_column :users, :adventurousness_affinity, :decimal
  	change_column :users, :instinctiveness_affinity, :decimal
  	change_column :users, :pace_affinity, :decimal
  	change_column :users, :valence_affinity, :decimal
  	change_column :users, :freshness_affinity, :decimal


  	change_column :movies, :adventurousness, :decimal
  	change_column :movies, :instinctiveness, :decimal
  	change_column :movies, :pace, :decimal
  	change_column :movies, :valence, :decimal
  	change_column :movies, :freshness, :decimal


  end
end
