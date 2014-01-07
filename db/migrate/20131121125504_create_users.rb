class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :region
      t.date :date_of_birth
      t.integer :years_work_experience
      t.integer :telephone_number
      t.string :city
      t.integer :postal_code
      t.string :gender
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
