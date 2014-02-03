class AddTasteAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :adventurousness_affinity, :integer
    add_column :users, :instinctiveness_affinity, :integer
    add_column :users, :pace_affinity, :integer
    add_column :users, :valence_affinity, :integer
    add_column :users, :freshness_affinity, :integer
  end
end
