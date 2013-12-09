class VacanciesController < ApplicationController
  def index
  	@vacancies = Vacancy.all
  end

  def show
  	@vacancy = Vacancy.find(params[:id])
  end

  def new
  	@vacancy = Vacancy.new

    @qualities = Quality.all
    @skills = Skill.all

    @vacancy.qualities.build
    @vacancy.skills.build
  end

  def edit
  	@vacancy = Vacancy.find(params[:id])
end

  def create 
  	@vacancy = Vacancy.create(vacancy_params)

  		if @vacancy.save
        params[:quality_id].split(',').each do |id|
          @vacancy.qualities << Quality.find(id)
        end

        params[:skill_id].split(',').each do |id|
          @vacancy.skills << Skill.find(id)
        end
  			redirect_to vacancies_path, notice: 'Vacature geplaatst!'
  		else
  			render action: "new"
  		end
  	end

    def update
    @vacancy = Vacancy.find(params[:id])
    if @vacancy.update_attributes(vacancy_params)
      flash[:success] = "Vacature geupdated"
      redirect_to @vacancy
    else
      render 'edit'
    end
  end
  end

  	



def vacancy_params
params.require(:vacancy).permit(:titel, :description, :vacancy_region, :vacancy_id)
end
