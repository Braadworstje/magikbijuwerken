class Vacancy < ActiveRecord::Base
	has_many :vacancies_qualities_skills
	has_many :qualities, through: :vacancies_qualities_skills
	has_many :skills, through: :vacancies_qualities_skills

	has_many :user_vacancies
	has_many :users, through: :user_vacancies

	scope :recent_vacancies, -> { order('created_at desc') }
end
