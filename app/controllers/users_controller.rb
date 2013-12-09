class UsersController < ApplicationController
  before_action :authorize, :except => [:index, :new, :create]
  
  def new
    @user = User.new(params[:id])

    @qualities = Quality.all
    @skills = Skill.all

    @user.qualities.build
    @user.skills.build
  
  end
  
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
      if @user.qualities.nil?
        redirect_to @werknemer
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
 if @user.update_attributes(user_params)
    redirect_to dashboard_path
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

    @user.qualities << Quality.find_by_id(params[:quality_id])

    if @user.save
      params[:quality_id].split(',').each do |id|
        @user.qualities << Quality.find(id)
      end

      params[:skill_id].split(',').each do |id|
        @user.skills << Skill.find(id)
      end

      flash[:notice] = "User profile created"
      sign_in @user
      redirect_to root_url
    else
      render 'new'
    end
  end

def match(user)
    @user = user
    @vacancies = Vacancy.all
    
    @matchscore = {}
    @matchscore.default = 0

    @userqualities = [] unless @userqualities

    @user.qualities.each do |uqs|
      @userqualities << uqs
    end

    @vacancies.each do |vt|
      vt.qualities.each do |q|
        for userquality in @userqualities
          if userquality == q
            @matchscore[vt] += 1
          end
        end
      end
    end
  end

private

def user_params 
  params.require(:user).permit(
     :email, :password, :password_confirmation, :admin, :first_name, :last_name, :quality_id, :skill_id, {:quality_ids => []},
      {:qualities_attributes => [:quality]}, {:skills_attributes => [:skill]}
  )
end
end

#def person_params
 #    params.require(:person).permit(:name, :age)
 #  end
#nd