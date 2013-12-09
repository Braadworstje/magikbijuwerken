class VacanciesQualitiesSkill < ActiveRecord::Base

	belongs_to :quality
    belongs_to :skill
    belongs_to :vacancy

end
