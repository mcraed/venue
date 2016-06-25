class HomeController < ApplicationController

  def index
  	@contributors = Contributor.all
  	@shows = Show.all
  	@episode = Episode.all.sample  	
  	@ran_epi = Episode.all.sample
  end
end
