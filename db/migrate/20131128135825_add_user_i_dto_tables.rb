class AddUserIDtoTables < ActiveRecord::Migration
  def change
  	add_column :qualities, :user_id, :integer
  	add_column :skills, :user_id, :integer
  end
end
