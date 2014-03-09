class AddCriticsAffinityToUser < ActiveRecord::Migration
  def change
    add_column :users, :critics_affinity, :decimal
  end
end
