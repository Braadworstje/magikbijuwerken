class Vacancy < ActiveRecord::Base
	has_many :vacancies_qualities_skills
	has_many :qualities, through: :vacancies_qualities_skills, :uniq => true
	has_many :skills, through: :vacancies_qualities_skills

	has_many :user_vacancies
	has_many :users, through: :user_vacancies, :uniq => true

	scope :recent_vacancies, -> { order('created_at desc') }
  
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  
end
