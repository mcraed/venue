class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.where(username: params[:username]).last

		if @user && @user.authenticate(params[:password])
			login_user(@user)
			redirect_to root_path
		else
			flash[:alert] = "Login failed. If you don't have an account yet, create your free account below the form!"
			render 'new'
		end
	end

	def contributor_new
		@cont = Contributor.new
	end

	def contributor_create
		@cont = Contributor.where(key: params[:key]).last

		if @cont && @cont.authenticate(params[:password])
			contributor_login(@cont)
			render @cont
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
