class UsersController < ApplicationController
  def new
  end

  def create
  	user = User.new(user_params)

  	if user.save
  		session[:user_id] = user.id
  		redirect_to "/events"
  	else
  		flash[:errors] = user.errors.full_messages
  		redirect_to '/users/new'
  	end
  end

  def show
  	@user = User.find(params[:id])
  end

  private
  def user_params
  	params.require(:users).permit(:id, :first_name, :last_name, :location, :state, :email, :password, :password_confirmation)
  end
end
