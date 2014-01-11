class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.add :latitude, :float
      t.add :longitude, :float
    end
    
    change_table :vacancies do |t|
      t.add :latitude, :float
      t.add :longitude, :float
    end
  end
end
