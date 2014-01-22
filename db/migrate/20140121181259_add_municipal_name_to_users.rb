class AddMunicipalNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :municipal_contact, :string
  end
end
