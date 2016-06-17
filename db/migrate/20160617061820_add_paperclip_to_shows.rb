class AddPaperclipToShows < ActiveRecord::Migration
  def change
  	add_attachment :shows, :image
  end
end
