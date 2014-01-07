class VacanciesController < ApplicationController
  helper_method :sort_column, :sort_direction, :sort_matchscore
  
  def index
    @vacancies = Vacancy.all(:order => sort_column + " " + sort_direction)
    @user = User.find_by_id(current_user)
    match(current_user)
  end


  def show
    @vacancy = Vacancy.find(params[:id])
  end

  def apply_to_vacancy
    @user = User.find_by_id(current_user)
    
    @user.vacancies << Vacancy.find(params[:id])
    
    redirect_to vacancies_path, notice: 'Reactie geplaatst!'
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
      redirect_to vacancies_path, notice: 'Vacature geplaatst!'
    else
      render action: "new"
    end
  end

  def update
    @vacancy = Vacancy.find(params[:id])

    @vacancies = Vacancy.all
    if @vacancy.update_attributes(vacancy_params)
      flash[:success] = "Vacature geupdated"
      redirect_to @vacancy
    else
      render 'edit'
    end
  end

  def destroy
    @vacancy = Vacancy.find(params[:id])
    flash[:notice] = "Vacancy deleted" 
    @vacancy.destroy
    redirect_to @vacancy
  end
end

def user_params
  params.require(:id)
end

def vacancy_params
  params.require(:vacancy).permit(:title, :description, :vacancy_address, :id, :vacancy_id, :sort, :direction, :sort_column, :sort_direction) 
end

private
  
def sort_column
  %w[title created_at #{@matchscore[Vacancy.id]}].include?(params[:sort]) ? params[:sort] : "created_at"
end
  
def sort_direction
  %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
end

