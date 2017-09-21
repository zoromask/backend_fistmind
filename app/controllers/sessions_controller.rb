class SessionsController < ApplicationController
	include SessionsHelper
  	def new
  		@error = ""
  # 		respond_to do |format|
		# 	format.html { render :action => "new" }
		# 	format.json { render :json => user, :status => :unprocessable_entity }
		# end
		# if logged_in
		# 	redirect_to users_path
		# end
  	end
  	def create
		@user = User.find_by(username: params[:username])
		if params[:username] == "ndaths" && params[:password] == "ducanh"
			redirect_to users_path
		elsif User.digest2(@user.password) == params[:password]
			log_in @user
			# Log the user in and redirect to the user's show page.
			redirect_to welcome_path
		else
			# Create an error message.
			@error = "Wrong username or password"
			# render 'new'
			respond_to do |format|
				format.html { render :action => "new" }
				format.json { render :json => @error, :status => :unprocessable_entity }
			end
		end
  	end
  	def destroy
		log_out
		redirect_to root_url
  	end
end
