class UsersController < ApplicationController
  before_action :authorize, :except => [:index, :new, :create]
  helper_method :sort_column, :sort_direction
  
  def index
    @users = User.all
    @vacancies = Vacancy.all
    
    if current_user.admin?
      @acceptedusers = User.where(accepted: true)
      @openusers = User.where(accepted: false)
    end
    
    match(current_user)
  end

  def new
    @user = User.new(params[:id])

    @qualities = Quality.all

    @user.qualities.build
  end
  
  def show
    @user = User.find(params[:id])

    @news = News.all
    
    match(@user)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])

     @vacancies = Vacancy.all
     if @user.update_attributes(user_params)
        redirect_to current_user
      else
        render :action => :edit
      end
  end

  def download_cv
    @user = User.find(params[:id])
    send_file(@user.cv.path,
          :disposition => 'attachment',
          :url_based_filename => false)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_url
  end

  def create
    @user = User.new(user_params)

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

  def image
    @user = User.find(params[:id])
    send_file "#{@user.image_url}", :disposition => 'inline', :x_sendfile => true
  end

  def applications
    @user = User.find_by_id(current_user)
  end
   
end
   
  private
  
  def user_params 
    params.require(:user).permit(
       :email, :password, :password_confirmation, :admin, :address, :accepted, :gender, :first_name, :last_name, :quality_id, :vacancy_id, :quality_ids, :vacancy_ids, 
       :image, :remove_image, :municipal, :cv, :remove_cv, :sort_column, :sort_direction, {:qualities_attributes => [:quality]}, {:vacancies_attributes => [:description]})
  end
#def person_params
 #    params.require(:person).permit(:name, :age)
 #  end
#nd