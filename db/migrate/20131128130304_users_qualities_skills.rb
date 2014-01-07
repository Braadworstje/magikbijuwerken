class UsersQualitiesSkills < ActiveRecord::Migration
  def change
  	create_table :users_qualities_skills do |t|
  		t.references :user
  		t.references :quality
  		t.references :skill
  	end
  end
  def self.down
  	drop_table :users_qualities_skills
  end
end
