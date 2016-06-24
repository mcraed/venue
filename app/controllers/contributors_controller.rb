class ContributorsController < ApplicationController
	
	include ApplicationHelper
	include SessionsHelper
	require 'date'
	def new
		@contributor = Contributor.new
	end

	def create
		@contributor = Contributor.new(contributor_params)

		if @contributor
			@contributor.key = @contributor.lname + @contributor.fname[0]
			@contributor.since = Time.now.strftime("%m/%Y")
			@contributor.save
			contributor_login(@contributor)
			redirect_to contributor_path(@contributor.id)
		else
			flash[:alert] = "Failed."
			render 'new'
		end 
	end

	def show
		@contributor = Contributor.find(params[:id])
		@show = Show.new
	end

	def index
		@contributors = Contributor.all

		@episode = Episode.all.sample
	end

	def edit
		@contributor = Contributor.find(params[:id])
	end

	def update
		# create role column?
		@contributor = Contributor.find(params[:id])

		if @contributor.update_attributes(contributor_params)
			puts 'success!'
			flash[:notice] = "Your Profile Was Succesfully Updated!"
			redirect_to contributor_path(@contributor.id)
		else
			flash[:alert] = "Update Failed; Try Again, Or Contact Venue To Report A Bug."
			render 'edit'
		end
	end

	def destroy
		@contributor = Contributor.find(params[:id])
		@contributor.destroy
		reset_session
		current_contributor = nil 
		flash[:alert] = "I'm assuming you were fired?"
		redirect_to root_path
	end

	private

	def contributor_params
		params.require(:contributor).permit(:fname, :lname, :aka, :email, :password, :password_confirmation, :avatar, :twitter, :bio)
	end
end
