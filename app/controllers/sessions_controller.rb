class SessionsController < ApplicationController
	def new

	end

	def create
		user = User.find_by(email: session_params[:email])
		
		if user && user.authenticate(session_params[:password])
			session[:user_id] = user.id
			redirect_to "/events"
		else
			flash[:errors] = ["Invalid Log In"]
			redirect_to '/users'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/users/new'
	end

	private
	def session_params
		params.require(:sessions).permit(:email, :password)
	end
end
