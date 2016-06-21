class EpisodesController < ApplicationController

	def new
		@episode = Episode.new
	end

	def create
		@show = Show.where(:id == params[:id]).last
		@episode = @show.episodes.build(episode_params)

		if @episode.save
			flash[:notice] = "Video successfully uploaded"
			redirect_to episode_path(@episode.id)
		else
			flash[:alert] = "Failed, video must be in mp4 format."
			redirect_to show_path(@show.id)
		end

	end

	def show
		@episode = Episode.find(params[:id])
		@show = Show.find(@episode.show_id)
	end

	def index
		@episodes = Episode.all
	end

	private

	def episode_params 
		params.require(:episode).permit(:title, :video, :description)
	end
end
