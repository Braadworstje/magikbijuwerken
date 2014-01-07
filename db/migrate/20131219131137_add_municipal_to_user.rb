class AddMunicipalToUser < ActiveRecord::Migration
  def change
  	add_column :users, :municipal, :string
  end
end
