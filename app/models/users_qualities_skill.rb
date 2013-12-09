class UsersQualitiesSkill < ActiveRecord::Base
	#accepts_nested_attributes :user_quality_skill

	belongs_to :quality
	belongs_to :skill
	belongs_to :user	
	
end
