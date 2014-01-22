class ChangeTelephonNumberToString < ActiveRecord::Migration
  def change
    remove_column :users, :telephone_number, :integer
    add_column :users, :telephone_number, :string
  end
end
