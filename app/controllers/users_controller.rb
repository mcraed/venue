class UsersController < ApplicationController

	include ApplicationHelper
	include SessionsHelper
	
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			login_user(@user)
			redirect_to @user
		else
			flash[:alert] = "Verification failed; check your fields and try again. If you don't have an account, create one for free!"
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def index
		@users = User.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update_attributes(user_params)
			flash[:notice] = "Your Profile Was Successfully Updated!"
			redirect_to user_path(@user)
		else
			flash[:alert] = "Update Failed; Check Your Fields And Try Again."
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		reset_session
		current_user = nil
		flash[:alert] = "Account Deleted; Peace And Love!"
		redirect_to root_path
	end

	def user_params
		params.require(:user).permit(:fname, :lname, :username, :email, :password, :password_confirmation, :avatar, :twitter, :bio)
	end
end
