class UsersController < ApplicationController
  before_action :authorize, :except => [:index, :new, :create]
  
  def index
    @users = User.all
    @vacancies = Vacancy.all
  end

  def new
    @user = User.new(params[:id])

    @qualities = Quality.all

    @user.qualities.build

  
  end
  
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
      if @user.qualities.nil? 
        redirect_to @user
      else
        match(@user)
      end
    end
  end

 def edit
  @user = User.find(params[:id])
# @user.find(params[:id])
    if @user.save
      redirect_to user_path
    end
  end

def update
 @user = User.find(params[:id])

 @vacancies = Vacancy.all
 if @user.update_attributes(params[:user])
      params[:vacancy_id].split(',').each do |id|
        @user.vacancies << Vacancy.find(id)
      end
    redirect_to current_user
  else
    render :action => :edit
  end
end


def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_url
  end

  def create
    @user = User.new(user_params)

    # @user.qualities << Quality.find_by_id(params[:quality_id])

    @qualities = Quality.all

    if @user.save
      params[:quality_id].split(',').each do |id|
        @user.qualities << Quality.find(id)
      end

      

      flash[:notice] = "User profile created"
      sign_in @user
      redirect_to current_user
    else
      render 'new'
    end
  end


def match(user)
    @user = user
    @vacancies = Vacancy.all
    
    @matchscore = {}
    @matchscore.default = 0

    @qualitiestotal = 0

    @userqualities = []

    @matchingqualities = {}

    @user.qualities.each do |uqs|
      @userqualities << uqs
      @qualitiestotal += 1
    end

    @vacancies.each do |vt|
        
      @matchingqualities[vt] = []

      vt.qualities.each do |q|
        for userquality in @userqualities
          if userquality == q
            @matchscore[vt] += 1
            @matchingqualities[vt] << q.quality
          end
        end
      end
    end
  end
private

def user_params 
  params.require(:user).permit(
     :email, :password, :password_confirmation, :admin, :first_name, :last_name, :quality_id, :vacancy_id, :quality_ids, :vacancy_ids,
      {:qualities_attributes => [:quality]}, {:vacancies_attributes => [:description]})
end
end

#def person_params
 #    params.require(:person).permit(:name, :age)
 #  end
#nd