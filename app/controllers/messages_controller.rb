class MessagesController < ApplicationController
	before_action :require_login

	def new
		init
	end

	def show
		@user = User.find params[:user_id]
		@message = Message.find(params[:id])

		if @message.read?
			redirect_to user_home_path
		else
			@message.read_at = Time.now
			@message.save
		end
	end

	def create
		init
		@message = Message.new(message_params)
		@message.sender_id = current_user.id
		if @message.save
			flash[:success] = "Successfully send the message"
			redirect_to user_home_path
		else
			flash.now[:error] = "Error: #{@message.errors.full_messages.to_sentence}"
			render 'new'
		end
	end

	private
	def message_params
		params.require(:message).permit(:recipient_id, :title, :body)
	end

	def init
		@user = User.find params[:user_id]
		@users = User.where(id: Friend.where(first_user: current_user).pluck(:second_user_id))
	end

	def require_login
		if !current_user
			flash[:error] = "You must be logged in to access this section"
			redirect_to  new_user_path
		end
	end
end
