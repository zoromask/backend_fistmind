class WelcomeController < ApplicationController
	def index
		if SessionsHelper.logged_in
			redirect_to users_path
		else
			redirect_to login_path
		end
	end
end
