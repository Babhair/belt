class UserController < ApplicationController
  before_action :require_login, only: [:show, :update] 

  before_action :required_correct_user, only: [:show, :update]
  
  def new
  	@user = User.new
  end

  def create
  	user = User.new(params.require(:user).permit(:fn, :ln, :email, :city, :state, :password, :password_confirmation))
  	if !user.valid?
  		@user = user
  		return render "new"
  	end
  	puts params
  	user.save

  session[:current_user] = user.id
  redirect_to "/events"

  end

  def show
    @user = User.find(session[:current_user])

  end

  def update
    @user = User.find(session[:current_user])

    @user.update(params.require(:user).permit(:fn, :ln, :email, :city, :state))

    redirect_to '/events'
  end

  def login
  	@user = User.find_by(:email => params[:user][:email])
  	is_valid = @user.authenticate(params[:user][:password])

  	if !is_valid
  		@user.errors.add(:base, :invalid_password, message: 'wrong password')
  		return render 'new'
  	end

  session[:current_user] = @user.id
  redirect_to "/events"

  end

  def logout
    session[:current_user] = nil
    @user = User.new
    return render 'new'
  end  

end
