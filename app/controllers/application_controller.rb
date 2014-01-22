class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_user?, :is_admin?, :authorize, :authorize_user

  def match(user)
    @user = user
    @vacancies = Vacancy.all if @vacancies.nil?
    
    @matchscore = {}
    @matchscore.default = 0

    @qualitiestotal = 0
    @userqualities = []

    @matchingqualities = {}

    @user.qualities.each do |uqs|
      @userqualities << uqs
      @qualitiestotal = @qualitiestotal + 1
    end

    @vacancies.each do |va|
      @matchingqualities[va] = []

      va.qualities.each do |q|
        for userquality in @userqualities
          if userquality == q
            @matchingqualities[va] << q.quality
            
          end
        end
      end
      if @qualitiestotal == 0
        @matchscore[va] = 0.0
      else
        @matchscore[va] = @matchingqualities[va].size.to_f / @qualitiestotal.to_f * 100.0
      end
    end
  end
  
 private
 
 def user_logged_in!
  return if current_user.present?
  flash[:alert] = 'please sign in to view this page'
  redirect_to login_url
end

  def sign_in(user)
    session[:user_id] = @user.id if user.present?
  end

  def sign_out
  	session[:user_id] = nil
  end

  def current_user
   @current_user ||= User.find_by id: session[:user_id] if session[:user_id]
   end 

  def current_user?
   current_user.present?
  end
  
  def authorize_user
    @user = User.find(params[:id]) if @user.nil?
    redirect_to current_user, notice: 'Verboden toegang' if (current_user.admin != true && @user.id != current_user.id)
  end
  
  def authorize_admin
    redirect_to current_user, notice: 'U bent geen admin' if (current_user && current_user.admin != true)
  end

  protected

	def authorize
    redirect_to signin_url, alert: "you need to login" if current_user.nil?
    end
  end

  def admin?
    if current_user && current_user.admin?
  end
end

