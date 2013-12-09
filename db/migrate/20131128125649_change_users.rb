class ChangeUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :region, :string
  	remove_column :users, :years_work_experience, :integer
  	remove_column :users, :city, :string
  	remove_column :users, :postal_code, :integer

  	add_column :users, :address, :string
  	add_column :users, :image, :string
  end
end