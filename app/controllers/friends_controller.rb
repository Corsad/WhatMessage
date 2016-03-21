class FriendsController < ApplicationController
	before_action :require_login

	def new
		init
	end

	def create
		init
		@friend = Friend.new(friend_params)
		@friend.first_user_id = current_user.id
		if @friend.save
			flash[:success] = "Add Friend Successfully"
			second_friend = Friend.create(first_user_id: @friend.second_user_id, second_user_id: @friend.first_user_id)
			redirect_to user_home_path
		else
			flash.now[:error] = "Error: #{@friend.errors.full_messages.to_sentence}"
			render 'new'
		end
	end

	def destroy
		@friendship = current_user.friends.find(params[:id])
		@fromFriend = Friend.find_by(first_user: @friendship.second_user, second_user: @friendship.first_user)

		@friendship.destroy
		@fromFriend.destroy

		flash[:success] = "Successfully destroyed friendship."
		redirect_to user_home_path
	end

	private
	def friend_params
		params.permit(:second_user_id)
	end

	def init
		@user = User.find params[:user_id]
		@users = User.where.not(id: Friend.where(first_user: current_user).pluck(:second_user_id)).where.not(id: current_user.id)
	end

	def require_login
		if !current_user
			flash[:error] = "You must be logged in to access this section"
			redirect_to  new_user_path
		end
	end
end
