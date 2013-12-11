class CreateUserVacancies < ActiveRecord::Migration
  def change
    create_table :user_vacancies do |t|
      t.integer :user_id
      t.integer :vacancy_id

      t.timestamps
    end
  end
end
