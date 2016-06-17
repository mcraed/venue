class AddKeyToContributors < ActiveRecord::Migration
  def change
  	add_column :contributors, :aka, :string
  	add_column :contributors, :key, :string
  	add_column :users, :username, :string
  end
end
