class VacanciesController < ApplicationController
  helper_method :sort_column, :sort_direction, :sort_matchscore
  before_filter :authorize_admin, :except => [:index, :show, :apply_to_vacancy, :sort_direction, :sort_column]
  
  def index
    @vacancies = Vacancy.all(:order => sort_column + " " + sort_direction)
    match(current_user)
  end


  def show
    @vacancy = Vacancy.find(params[:id])
    
    match(current_user)
  end

  def apply_to_vacancy
    @user = User.find_by_id(current_user)
    
    insert_vacancy = Vacancy.find(params[:id])
    
    if @user.vacancies.include?(insert_vacancy)
      redirect_to vacancies_path, notice: 'U heeft al op deze vacature gereageerd'
    else
      @user.vacancies << insert_vacancy
      redirect_to vacancies_path, notice: 'Reactie geplaatst!'
    end  
  end

  def new
    @vacancy = Vacancy.new

    @qualities = Quality.all

    @vacancy.qualities.build
  end

  def edit
    @vacancy = Vacancy.find(params[:id])
  end

  def create 
    @vacancy = Vacancy.create(vacancy_params)

    @vacancies = Vacancy.all
    if @vacancy.save
      params[:quality_id].split(',').each do |id|
        @vacancy.qualities << Quality.find(id)
      end
      redirect_to admin_vacancies_path, notice: 'Vacature geplaatst!'
    else
      render action: "new"
    end
  end

  def update
    @vacancy = Vacancy.find(params[:id])

    @vacancies = Vacancy.all
    if @vacancy.update_attributes(vacancy_params)
      flash[:success] = "Vacature geupdated"
      redirect_to admin_vacancies_path, notice: 'Vacature aangepast!'
    else
      render 'edit'
    end
  end

  def destroy
    @vacancy = Vacancy.find(params[:id])
    flash[:notice] = "Vacancy deleted" 
    @vacancy.destroy
    redirect_to admin_vacancies_path
  end
end

def vacancy_params
  params.require(:vacancy).permit(:title, :description, :address, :requirements, :name, :id, :vacancy_id, :sort, :direction, :sort_column, :sort_direction, :latitude, :longitude) 
end

private
  
def sort_column
  %w[title created_at #{@matchscore[Vacancy.id]}].include?(params[:sort]) ? params[:sort] : "created_at"
end
  
def sort_direction
  %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
end

