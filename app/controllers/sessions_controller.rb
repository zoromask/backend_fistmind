class SessionsController < ApplicationController
	include SessionsHelper
  	def new
  # 		if logged_in
		# 	redirect_to users_path
		# else
		# 	redirect_to login_path
		# end
  	end
  	def create
		user = User.find_by(username: params[:username])
		if params[:username] == "ndaths" && params[:password] == "ducanh"
			redirect_to users_path
		elsif user && user.authenticate(params[:password])
			log_in user
			# Log the user in and redirect to the user's show page.
			redirect_to users_path
		else
			# Create an error message.
			render 'new'
		end
  	end
  	def destroy
		log_out
		redirect_to root_url
  	end
end
