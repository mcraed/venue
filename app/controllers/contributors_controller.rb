class ContributorsController < ApplicationController
	
	include ApplicationHelper

	def new
		@contributor = Contributor.new
	end

	def create
		@contributor = Contributor.new(contributor_params)

		if @contributor
			@contributor.key = @contributor.lname + @contributor.fname[0]
			@contributor.save
			contributor_login(@contributor)
			redirect_to @contributor
		else
			flash[:alert] = "Failed."
		end 
	end

	def show
		@contributor = Contributor.find(params[:id])
	end

	def index
		@contributors = Contributor.all
	end

	def destroy
		@contributor = Contributor.find(params[:id])
		@contributor.destroy
		reset_session
		current_contributor = nil 
		flash[:alert] = "Succesfully logged out."
		redirect_to root_path
	end

	private

	def contributor_params
		params.require(:contributor).permit(:fname, :lname, :aka, :email, :password_digest, :avatar, :twitter, :bio)
	end
end
