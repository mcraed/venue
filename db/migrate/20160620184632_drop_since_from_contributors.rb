class DropSinceFromContributors < ActiveRecord::Migration
  def change
  	remove_column :contributors, :since
  	add_column :contributors, :since, :string
  end
end
