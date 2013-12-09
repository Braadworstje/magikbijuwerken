class VacanciesQualitiesSkills < ActiveRecord::Migration
  def change
  	create_table :vacancies_qualities_skills do |t|
  		t.references :vacancy
  		t.references :quality
  		t.references :skill
  	end
  end
  def self.down
  	drop_table :vacancies_qualities_skills
  end
end
