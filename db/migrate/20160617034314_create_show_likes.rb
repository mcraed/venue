class CreateShowLikes < ActiveRecord::Migration
  def change
    create_table :show_likes do |t|
    	t.belongs_to :users, index: true
    	t.belongs_to :shows, index: true
    end
  end
end
