class EpisodesController < ApplicationController

	def new
		@episode = Episode.new
	end

	def create
		@episode = Episode.new(episode_params)

		if @episode.save
			flash[:notice] = "Video successfully uploaded"
		else
			flash[:alert] = "There was a problem"
		end

		rediect_to root_path
	end

	private

	def episode_params 
		params.require(:episode).permit(:title, :video)
	end
end
