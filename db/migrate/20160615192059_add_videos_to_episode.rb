class AddVideosToEpisode < ActiveRecord::Migration
  def change
  	add_attachment :episodes, :video
  end
end
