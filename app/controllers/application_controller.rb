class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_user?, :is_admin?, :authorize

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

  protected

	def authorize
    redirect_to signin_url, alert: "you need to login" if current_user.nil?
    end
  end

  def admin?
    if current_user && current_user.admin?
  end
end

