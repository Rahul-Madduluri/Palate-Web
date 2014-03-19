class ChangeEchoNestIdToString < ActiveRecord::Migration
  def change
  	change_column :artists, :echonest_id, :string
  end
end
