class Quality < ActiveRecord::Base

	has_many :users_qualities_skills
	has_many :vacancies_qualities_skills

	has_many :users, through: :users_qualities_skills
	has_many :vacancies, through: :vacancies_qualities_skills

end
