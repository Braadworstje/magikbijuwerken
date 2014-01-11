class AddLatitudeLongitudeToUsersAndVacancies < ActiveRecord::Migration
  def change
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_column :vacancies, :latitude, :float
    add_column :vacancies, :longitude, :float
  end
end
