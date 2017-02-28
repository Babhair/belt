class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
  	if session[:current_user]
  		return @user = User.find(session[:current_user])
  	end
  end
  helper_method :current_user

  def require_login
  	if !current_user
      redirect_to 'user/login'
    end
   end

   def required_correct_user
	 if !current_user  
	 	redirect_to '/user/login'
	 	return
	 end 	
	 if current_user.id != params[:id].to_i
	 	redirect_to '/user/login'+current_user.id.to_s
	 	return
	 end
   end
end
