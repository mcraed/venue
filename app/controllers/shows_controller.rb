class ShowsController < ApplicationController

	def new
		@show = Show.new
		@episode = Episode.new
	end

	def create
		@show = Show.new(show_params)

		if @show.save
			flash[:notice] = "Success"
			redirect_to edit_show_path(@show)
		else
			flash[:alert] = "Failed"
			render 'new'
		end
	end

  def show
  	@show = Show.find(params[:id])
  end
  
  def index
  	@shows = Show.all
  end

  def edit
  	@show = Show.find(params[:id])
  	   @episode = Episode.new

  end

  def update
  	@show = Show.find(params[:id])

  	if @show.update_attributes(show_params)
  		flash[:notice] = "Success"
  	else
  		flash[:alert] = "Failed"
  	end

  	redirect_to show_path
  end

  def destroy
  	@show = Show.find(params[:id])
  	@show.destroy
  	flash[:notice] = "destroyed"
  	redirect_to shows_path
  end

  private

  def show_params
  	params.require(:show).permit(:name, :image)
  end
end
