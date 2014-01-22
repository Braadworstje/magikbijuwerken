
  
  #validates :first_name, presence: true, length: { maximum: 50 }
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, presence:   true,
    #                format:     { with: VALID_EMAIL_REGEX },
   #                 uniqueness: { case_sensitive: false }
  
  #validates :password, length: { minimum: 6 }
    
class User < ActiveRecord::Base
 
 mount_uploader :image, AvatarUploader
 mount_uploader :cv, CvUploader
 has_secure_password

 has_many :users_qualities_skills
 has_many :qualities, through: :users_qualities_skills, :uniq => true
 has_many :skills, through: :users_qualities_skills, :uniq => true
 has_many :user_vacancies
 has_many :vacancies, through: :user_vacancies, :uniq => true

 accepts_nested_attributes_for :user_vacancies, :vacancies
 accepts_nested_attributes_for :users_qualities_skills, :qualities
 accepts_nested_attributes_for :users_qualities_skills, :skills

 validates :email, uniqueness: true
 validates :first_name, :presence => true
 validates :last_name, :presence => true
 validates :password, :presence => true

 geocoded_by :address
 after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

 def email=(value)
  value = value.strip.downcase
  write_attribute :email, value
 end
end
