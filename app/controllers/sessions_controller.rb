class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.authenticate(params[:email], params[:password])
		if user
			sesson[:user_id] = user.id
			redirect_to root_url, :notice => "Logged In"
		else
			flash.now.alert = "Invalid email or password"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, flash.notice => "Logged out!"
	end
end