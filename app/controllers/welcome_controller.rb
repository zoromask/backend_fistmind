class WelcomeController < ApplicationController
	def index
	end
	# show list messages
	def list
		@current_user = User.find(session[:user_id]) if session[:user_id]
		# @messages = Message.where('receiver = :receiver or sender = :sender', receiver: @current_user, sender: @current_user)
		@messages = Message.select('u1.username as tsender, u2.username as treceiver, content').joins("JOIN users as u1 ON messages.sender = u1.id join users as u2 on messages.receiver = u2.id").where('receiver = :receiver or sender = :sender', receiver: @current_user, sender: @current_user)

	end
	# new messages form
	def new
		@current_user = User.find(session[:user_id]) if session[:user_id]
		@users = User.where.not(id: @current_user.id)
		if params[:id] == "0"
			@receiver = nil
			@username = ""
			@receiverID = 0
		else
			@receiver = User.find(params[:id])
			@username = @receiver.username
			@receiverID = @receiver.id
		end
		@messages = Message.all
	end
	# save message
	def save
		@current_user = User.find(session[:user_id]) if session[:user_id]
		@messages = params[:content]
		@receiver = params[:receiver]

		@message = Message.new
		@message.sender = @current_user.id
		@message.receiver = @receiver
		@message.content = @messages
		respond_to do |format|
			if @message.save
				format.html  { redirect_to action: "new", id: @receiver}
			else
				format.html  { render :action => "new" }
				format.json  { render :json => @post.errors, :status => :unprocessable_entity }
			end
		end
	end
end
