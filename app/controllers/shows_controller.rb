class ShowsController < ApplicationController
  include ApplicationHelper

	def new
		@show = Show.new
    @contributor = current_contributor
	end

	def create
		@show = Show.new(show_params)
    @contributor = current_contributor

		if @show.save
      @contributor.shows << @show
			flash[:notice] = "Success"
			redirect_to edit_show_path(@show)
		else
			flash[:alert] = "Failed"
			render 'new'
		end
	end

  def show
  	@show = Show.find(params[:id])
    @episode = Episode.new
    @contributor = current_contributor
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

  def add_contributor
    @show = Show.find(params[:id])
    @contributor = Contributor.find(params[:id])

    if @contributor
      @contributor.shows << @show
      flash[:notice] = "You were added to #{@show.id}, looking good!"
      redirect_to show_path
    else
      flash[:alert]  = "Something went wrong; try again."
      render 'edit'
    end
  end

  def destroy
  	@show = Show.find(params[:id])
  	@show.destroy
  	flash[:notice] = "destroyed"
  	redirect_to shows_path
  end

  private

  def show_params
  	params.require(:show).permit(:name, :image, :desc)
  end
end
