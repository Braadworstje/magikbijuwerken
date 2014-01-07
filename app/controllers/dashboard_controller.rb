class DashboardController < ApplicationController

	before_action :user_logged_in!

 def static
 	
end
 def index
 	@users = User.all
 end

 def show
 	@users = User.all
end
end
