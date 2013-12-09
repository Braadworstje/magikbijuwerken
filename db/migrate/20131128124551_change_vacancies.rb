class ChangeVacancies < ActiveRecord::Migration
  def change
  	remove_column :vacancies, :titel, :string
  	remove_column :vacancies, :description, :string
  	remove_column :vacancies, :vacancy_requirements, :string
  	remove_column :vacancies, :vacancy_region, :string

  	add_column :vacancies, :title, :string
  	add_column :vacancies, :description, :text
  	add_column :vacancies, :name, :string
  	add_column :vacancies, :email, :string
  	add_column :vacancies, :telephone_number, :integer
  	add_column :vacancies, :requirements, :string
  	add_column :vacancies, :address, :string
  	add_column :vacancies, :image, :string
  end
end