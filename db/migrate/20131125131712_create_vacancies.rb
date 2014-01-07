class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :titel
      t.string :description
      t.string :vacancy_requirements
      t.string :vacancy_region

      t.timestamps
    end
  end
end
