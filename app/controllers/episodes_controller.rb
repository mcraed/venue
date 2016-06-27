class EpisodesController < ApplicationController

	def new
		@episode = Episode.new
	end

	def create
		@show = Show.where(:id == params[:id]).last
		@contributor = Contributor.where(:id == params[:id]).last
		@episode = @show.episodes.build(episode_params)

		if @episode.save
			@contributor.episodes << @episode
			flash[:notice] = "Video successfully uploaded"
			redirect_to show_path(@show.id)
		else
			flash[:alert] = "Failed, video must be in mp4 format."
			redirect_to show_path(@show.id)
		end

	end

	def add_contributor
		@episode = Episode.find(params[:id])
		@contributor = Contributor.where(:fname == params[:fname] && :lname == params[:lname]).first
		
		if @contributor
			@episode.contributors << @contributor
			flash[:notice] = "#{@contributor.fname} was successfully added to #{@episode.title}!"
			render 'edit'
		else
			flash[:alert] = "Currently unable to add contributor."
			render 'edit'
		end
	end

	def edit
		@episode = Episode.find(params[:id])
		@contributor = Contributor.where(:fname == params[:fname] && :lname == params[:lname]).first
	end	

	def update
		@episode = Episode.find(params[:id])
		@contributor = Contributor.where(:fname == params[:fname] && :lname == params[:lname]).first
		
		if @episode.update_attributes(episode_params)
			flash[:notice] = "#{@episode.title} was successfully updated!"
			redirect_to episode_path(@episode.id)
		else
			flash[:alert] = "Something went wrong."
			render 'edit'
		end
	end

	def show
		@episode = Episode.find(params[:id])
		@show = Show.find(@episode.show_id)
	end

	def index
		@episodes = Episode.all
	end

	def destroy
		@episode = Episode.find(params[:id])
		@show = Show.find(@episode.show_id)

		if @episode
			@episode.delete
			flash[:notice] = "Episode deleted"
			redirect_to show_path(@show.id)
		else
			flash[:alert] = "Something went wrong"
			render 'edit'
		end
	end

	private

	def episode_params 
		params.require(:episode).permit(:title, :video, :description)
	end
end
