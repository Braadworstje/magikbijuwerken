class VacanciesController < ApplicationController
  def index
  	@vacancies = Vacancy.all
    @user = User.find_by_id(current_user)
  end


  def show
  	@vacancy = Vacancy.find(params[:id])
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
params.require(:vacancy).permit(:title, :description, :vacancy_address, :id, :vacancy_id)
end
