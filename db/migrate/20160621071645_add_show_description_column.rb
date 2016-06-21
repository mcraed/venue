class AddShowDescriptionColumn < ActiveRecord::Migration
  def change
  	add_column :shows, :desc, :text
  end
end
