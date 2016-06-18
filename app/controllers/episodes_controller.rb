class EpisodesController < ApplicationController

	def new
		@episode = Episode.new
	end

	def create
		@show = Show.where(:id == params[:id]).last
		@episode = @show.episodes.build(episode_params)

		if @episode.save
			flash[:notice] = "Video successfully uploaded"
		else
			flash[:alert] = "There was a problem"
		end

		redirect_to show_path(@show.id)
	end

	def index
		@episodes = Episode.all
	end

	private

	def episode_params 
		params.require(:episode).permit(:title, :video)
	end
end
