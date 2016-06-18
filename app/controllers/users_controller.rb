class UsersController < ApplicationController

	include ApplicationHelper

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			login_user(@user)
			redirect_to @user
		else
			flash[:alert] = "Verification failed; check your fields and try again. If you don't have an account, create your free account below!"
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def index
		@users = User.all
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		reset_session
		current_user = nil
		flash[:alert] = "See you next time!"
		redirect_to root_path
	end

	def user_params
		params.require(:user).permit(:fname, :lname, :username, :email, :password, :password_confirmation, :avatar, :twitter, :bio)
	end
end
