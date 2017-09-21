class UsersController < ApplicationController
	# show form add user
	def new
		@user = User.new
	end
	# show form update user
	def show
		@user = User.find(params[:id])
		respond_to do |format|
			format.html { render :action => "show" }
			format.json { render :json => @user }
		end
	end
	# update user
	def update
		# debugger(user_params)
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to @user
		else
			respond_to do |format|
				format.html { render :action => "show" }
				format.json { render :json => @post.errors, :status => :unprocessable_entity }
			end
		end
	end
	# show list users
	def index
		@users = User.all
	end
	# save new user
	def create
		# debugger(user_params)
		@user = User.new(user_params)
		respond_to do |format|
			if @user.save
				format.html  { redirect_to action: "index" }
			else
				format.html  { render :action => "new" }
				format.json  { render :json => @post.errors, :status => :unprocessable_entity }
			end
		end
	end
	# define user parameters
	private
    	def user_params
			params.permit(:username, :password, :role)
		end
end
