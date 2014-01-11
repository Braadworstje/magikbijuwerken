class AdminController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def stats
    @users = User.all
    @acceptedusers = User.where(accepted: true)
    @openusers = User.where(accepted: false)
  end
  
  def replies
    @users = User.all
  end
  
  def users
    @users = User.all
    @acceptedusers = User.where(accepted: true)
    @openusers = User.where(accepted: false)
  end
  
  def vacancies
    @vacancies = Vacancy.all(:order => sort_column + " " + sort_direction)
  end
  
  def pages
    
  end
  
  def qualities
    @qualities = Quality.all(:order => sort_column + " " + sort_direction)
  end
end

def user_params 
  params.require(:user).permit(
     :email, :password, :password_confirmation, :admin, :accepted, :first_name, :last_name, :quality_id, :vacancy_id, :quality_ids, :vacancy_ids, 
     :image, :remove_image, :municipal, :cv, :remove_cv, :gender, :address, :latitude, :longitude, {:qualities_attributes => [:quality]}, {:vacancies_attributes => [:description]})
end

private
  
def sort_column
  %w[quality title created_at #{@matchscore[Vacancy.id]}].include?(params[:sort]) ? params[:sort] : "created_at"
end
  
def sort_direction
  %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
end