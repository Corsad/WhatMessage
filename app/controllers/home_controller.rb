class HomeController < ApplicationController
	before_action :is_login

	def index
	end

	private
	def is_login
		if !!current_user
			redirect_to user_home_path
		end
	end
end
