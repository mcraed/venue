class AddSinceToContributor < ActiveRecord::Migration
  def change
  	add_column :contributors, :since, :string
  end
end
