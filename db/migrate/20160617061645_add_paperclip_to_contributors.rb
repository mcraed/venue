class AddPaperclipToContributors < ActiveRecord::Migration
  def change
  	add_attachment :contributors, :avatar
  end
end
