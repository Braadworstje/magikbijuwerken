class Vacancy < ActiveRecord::Base
	
	has_many :vacancies_qualities_skills
	has_many :qualities, through: :vacancies_qualities_skills
	has_many :skills, through: :vacancies_qualities_skills
end
