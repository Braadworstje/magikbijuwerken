class AdminController < ApplicationController
  helper_method :sort_column, :sort_direction, :change_finished
  before_action :authorize
  before_filter :authorize_admin
  
  
  def stats
    @users = User.all
    @acceptedusers = User.where(accepted: true)
    @openusers = User.where(accepted: false)
    
    @finishedreplies = UserVacancy.where(finished: true)
    
    @openreplies = UserVacancy.where(finished: false)
  end
  
  def replies
    @users = User.where(admin: false)
    @users.order(sort_column + " " + sort_direction)
    
    @vacancies = Vacancy.all(:order => sort_column + " " + sort_direction)
  end
  
  def news
    @news = News.all(:order => sort_column + " " + sort_direction)
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
    @pages = Page.all
  end
  
  def qualities
    @qualities = Quality.all(:order => sort_column + " " + sort_direction)
  end
  
  def change_finished

    @user = User.find(params[:user_id])
    @vacancy = Vacancy.find(params[:vacancy_id])

    uv = @user.user_vacancies.where("user_id == :user_id AND vacancy_id == :vacancy_id",
    {user_id: @user.id, vacancy_id: @vacancy.id}).first
    
    if uv.finished
      if uv.update_attribute(:finished, 'false')
        redirect_to admin_replies_path
      end
    else
      if uv.update_attribute(:finished, 'true')
        redirect_to admin_replies_path
      end
    end
  end
end

def user_params 
  params.require(:user).permit(
  :email, :password, :password_confirmation, :admin, :accepted, :first_name, :last_name, :quality_id, :vacancy_id, :quality_ids, :vacancy_ids, :telephone_number,
  :image, :remove_image, :municipal, :municipal_contact, :cv, :remove_cv, :gender, :address, :latitude, :longitude, {:qualities_attributes => [:quality]}, {:vacancies_attributes => [:description]})
end

private
  
def sort_column
  %w[quality title first_name created_at name #{@matchscore[Vacancy.id]}].include?(params[:sort]) ? params[:sort] : "created_at"
end
  
def sort_direction
  %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
end
