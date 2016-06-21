class SessionsController < ApplicationController

	include SessionsHelper
	def new
		
	end

	def create
		@user = User.where(username: params[:session][:username]).last

		if @user && @user.authenticate(params[:session][:password])
			login_user(@user)
			redirect_to user_path(@user)
		else
			flash[:alert] = "Login failed. If you don't have an account yet, create your free account below the form!"
			render 'new'
		end
	end

	def contributor_new
		
	end

	def contributor_create
		@contributor = Contributor.where(key: params[:session][:key]).last
		@new_cont = Contributor.new
		if @contributor && @contributor.authenticate(params[:session][:password])
			contributor_login(@contributor)
			redirect_to contributor_path(@contributor)
		else
			flash[:alert] = "Failed. Check your credentials or contact Venue for support"
			render 'new'
		end
	end

	def destroy
		reset_session
		@current_user = nil
		@current_contributor = nil
		flash[:success] = "See you soon!"
		redirect_to root_path
	end
end
