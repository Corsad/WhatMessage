class UsersController < ApplicationController
	before_action :require_login, except: [:new, :create]

	def index
		@received_messages = current_user.received_messages.page(params[:page]).order(created_at: :desc).per(10)
		@sent_messages = current_user.sent_messages.page(params[:page]).order(created_at: :desc).per(10);
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create user_params

		if @user.save
		# if @user.persisted?
		session[:user_id] = @user.id
		flash[:success] = "Registed Success"
		redirect_to user_home_path
	else
		flash.now[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
		render 'new'
	end
end

private
def user_params
	params.require(:user).permit(:name, :email, :password, :password_confirmation)
end

def require_login
	if !current_user
		flash[:error] = "You must be logged in to access this section"
		redirect_to  new_user_path
	end
end
end
